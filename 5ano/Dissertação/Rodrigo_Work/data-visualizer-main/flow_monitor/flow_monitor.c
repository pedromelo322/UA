/**
 * @file flow_monitor.c
 * @brief User-space: carrega o programa TC eBPF, anexa-o ao ingress e ao egress
 *        da interface dada, e publica periodicamente um snapshot completo do flow_map
 *        numa fila IPC ZeroMQ. A media do tamanho dos pacotes e o debito por flow 
 *        sao derivados a partir dos acumuladores brutos do kernel.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>
#include <time.h>
#include <sys/stat.h>
#include <net/if.h>
#include <arpa/inet.h>
#include <bpf/libbpf.h>
#include <bpf/bpf.h>
#include <zmq.h>
#include <json-c/json.h>
#include "flow_monitor.skel.h"

/* Chave do flow_map: 5-tuplo bidirecional (ips + portas + protocolo). Os
 * dois sentidos do mesmo fluxo mapeiam para a mesma entrada. */
struct flow_mon_key {
    __u32 ip_a;
    __u32 ip_b;
    __u16 port_a;
    __u16 port_b;
    __u8  proto;
    __u8  _pad[3];
};

/* Estado minimo por fluxo; media e debito sao calculados em user space. */
struct flow_mon_stats {
    __u64 packets;
    __u64 sum_pkt_size;
    __u64 first_ts_ns;
    __u64 last_ts_ns;
};


#define DEFAULT_ENDPOINT "tcp://*:5556"
#define DEFAULT_INTERVAL_MS 1000
#define ZMQ_TOPIC "flows"

static volatile sig_atomic_t running = 1;

static void sig_handler(int sig)
{
    (void)sig;
    running = 0;
}

/*Converte o ktime do kernel em unix time */
static __s64 monotonic_to_realtime_offset_ns(void)
{
    struct timespec mono, real;

    clock_gettime(CLOCK_MONOTONIC, &mono);
    clock_gettime(CLOCK_REALTIME, &real);

    __s64 mono_ns = (__s64)mono.tv_sec * 1000000000LL + mono.tv_nsec;
    __s64 real_ns = (__s64)real.tv_sec * 1000000000LL + real.tv_nsec;

    return real_ns - mono_ns;
}

/* Percorre o flow_map e constroi a arvore JSON com todos os fluxos */
static struct json_object *build_snapshot_json(int map_fd)
{
    struct flow_mon_key key, next_key;
    struct flow_mon_stats stats;
    bool have_key = false;

    __s64 offset_ns = monotonic_to_realtime_offset_ns();
    struct timespec now;
    clock_gettime(CLOCK_REALTIME, &now);
    __s64 now_unix_ns = (__s64)now.tv_sec * 1000000000LL + now.tv_nsec;

    struct json_object *root = json_object_new_object();
    struct json_object *flows = json_object_new_array();
    if (!root || !flows) {
        json_object_put(root);
        json_object_put(flows);
        return NULL;
    }
    json_object_object_add(root, "ts_unix_ns", json_object_new_int64(now_unix_ns));
    json_object_object_add(root, "flows", flows);

    while (bpf_map_get_next_key(map_fd, have_key ? &key : NULL, &next_key) == 0) {
        if (bpf_map_lookup_elem(map_fd, &next_key, &stats) == 0 && stats.packets > 0) {
            char ip_a_str[INET_ADDRSTRLEN], ip_b_str[INET_ADDRSTRLEN];
            struct in_addr a = { .s_addr = next_key.ip_a };
            struct in_addr b = { .s_addr = next_key.ip_b };

            inet_ntop(AF_INET, &a, ip_a_str, sizeof(ip_a_str));
            inet_ntop(AF_INET, &b, ip_b_str, sizeof(ip_b_str));

            __u64 mean_pkt_size = stats.sum_pkt_size / stats.packets;
            __u64 duration_ns = stats.last_ts_ns - stats.first_ts_ns;
            __s64 last_seen_unix_ns = (__s64)stats.last_ts_ns + offset_ns;

            struct json_object *flow = json_object_new_object();
            json_object_object_add(flow, "ip_a", json_object_new_string(ip_a_str));
            json_object_object_add(flow, "port_a", json_object_new_int(next_key.port_a));
            json_object_object_add(flow, "ip_b", json_object_new_string(ip_b_str));
            json_object_object_add(flow, "port_b", json_object_new_int(next_key.port_b));
            json_object_object_add(flow, "proto", json_object_new_int(next_key.proto));
            json_object_object_add(flow, "packets", json_object_new_int64((int64_t)stats.packets));
            json_object_object_add(flow, "total_bytes", json_object_new_int64((int64_t)stats.sum_pkt_size));
            json_object_object_add(flow, "mean_pkt_size", json_object_new_int64((int64_t)mean_pkt_size));
            json_object_object_add(flow, "first_seen_ns", json_object_new_int64((int64_t)stats.first_ts_ns));
            json_object_object_add(flow, "last_seen_ns", json_object_new_int64((int64_t)stats.last_ts_ns));
            json_object_object_add(flow, "last_seen_unix_ns", json_object_new_int64(last_seen_unix_ns));
            json_object_object_add(flow, "duration_ns", json_object_new_int64((int64_t)duration_ns));

            if (duration_ns == 0) {
                json_object_object_add(flow, "throughput_bps", NULL);
            } else {
                double bps = (double)stats.sum_pkt_size * 8.0 * 1e9 / (double)duration_ns;
                json_object_object_add(flow, "throughput_bps", json_object_new_double(bps));
            }

            json_object_array_add(flows, flow);
        }
        key = next_key;
        have_key = true;
    }

    return root;
}

/* Constroi o snapshot e publica-o no socket ZMQ (topico + payload JSON) */
static void publish_snapshot(void *pub, int map_fd)
{
    struct json_object *root = build_snapshot_json(map_fd);
    if (!root) {
        fprintf(stderr, "Aviso: falha a construir snapshot JSON, ignorado\n");
        return;
    }

    const char *json_str = json_object_to_json_string_ext(root, JSON_C_TO_STRING_PLAIN);
    size_t len = strlen(json_str);

    if (zmq_send(pub, ZMQ_TOPIC, strlen(ZMQ_TOPIC), ZMQ_SNDMORE) < 0) {
        fprintf(stderr, "Aviso: zmq_send (topico) falhou: %s\n", zmq_strerror(errno));
        json_object_put(root);
        return;
    }
    if (zmq_send(pub, json_str, len, 0) < 0)
        fprintf(stderr, "Aviso: zmq_send (payload) falhou: %s\n", zmq_strerror(errno));

    json_object_put(root);
}

/* Cria o TC hook e anexa o programa BPF num ponto (ingress/egress) */
static int attach_tc(struct bpf_tc_hook *hook, struct bpf_tc_opts *opts,
                     int ifindex, enum bpf_tc_attach_point point,
                     int prog_fd, bool *created)
{
    int err;

    hook->sz = sizeof(*hook);
    hook->ifindex = ifindex;
    hook->attach_point = point;

    err = bpf_tc_hook_create(hook);
    if (err == 0) {
        *created = true;
    } else if (err != -EEXIST) {
        fprintf(stderr, "Falha ao criar TC hook: %s\n", strerror(-err));
        return err;
    }

    opts->sz = sizeof(*opts);
    opts->handle = 1;
    opts->priority = 1;
    opts->prog_fd = prog_fd;

    err = bpf_tc_attach(hook, opts);
    if (err) {
        fprintf(stderr, "Falha ao attach TC: %s\n", strerror(-err));
        return err;
    }

    return 0;
}

/* Remove o programa BPF do TC hook */
static void detach_tc(struct bpf_tc_hook *hook, struct bpf_tc_opts *opts)
{
    struct bpf_tc_opts detach_opts = {
        .sz       = sizeof(detach_opts),
        .handle   = opts->handle,
        .priority = opts->priority,
    };
    bpf_tc_detach(hook, &detach_opts);
}

static void usage(const char *prog)
{
    fprintf(stderr,
            "Uso: %s -i <interface> [-e <endpoint>] [-t <intervalo_ms>]\n"
            "  -i  interface onde anexar o programa TC (obrigatorio)\n"
            "  -e  endpoint ZeroMQ  (default: %s)\n"
            "  -t  intervalo entre snapshots em ms (default: %d)\n",
            prog, DEFAULT_ENDPOINT, DEFAULT_INTERVAL_MS);
}

int main(int argc, char **argv)
{
    const char *ifname = NULL;
    const char *endpoint = DEFAULT_ENDPOINT;
    int interval_ms = DEFAULT_INTERVAL_MS;
    int opt;

    while ((opt = getopt(argc, argv, "i:e:t:h")) != -1) {
        switch (opt) {
        case 'i': ifname = optarg; break;
        case 'e': endpoint = optarg; break;
        case 't': interval_ms = atoi(optarg); break;
        default:  usage(argv[0]); return 1;
        }
    }

    if (!ifname || interval_ms <= 0) {
        usage(argv[0]);
        return 1;
    }

    struct flow_monitor_bpf *skel = NULL;
    struct bpf_tc_hook hook_in = {0}, hook_eg = {0};
    struct bpf_tc_opts opts_in = {0}, opts_eg = {0};
    bool attached_in = false, attached_eg = false;
    bool qdisc_created = false;
    void *ctx = NULL, *pub = NULL;
    const char *ipc_path = NULL;
    int ifindex, prog_fd, map_fd;
    int ret = 1;

    ifindex = if_nametoindex(ifname);
    if (!ifindex) {
        fprintf(stderr, "Interface %s nao encontrada\n", ifname);
        return 1;
    }

    signal(SIGINT, sig_handler);
    signal(SIGTERM, sig_handler);

    /*1. ZMQ */
    ctx = zmq_ctx_new();
    if (!ctx) {
        fprintf(stderr, "Falha em zmq_ctx_new: %s\n", zmq_strerror(errno));
        goto cleanup;
    }

    pub = zmq_socket(ctx, ZMQ_PUB);
    if (!pub) {
        fprintf(stderr, "Falha em zmq_socket: %s\n", zmq_strerror(errno));
        goto cleanup;
    }

    int hwm = 100;
    zmq_setsockopt(pub, ZMQ_SNDHWM, &hwm, sizeof(hwm));

    if (zmq_bind(pub, endpoint) != 0) {
        fprintf(stderr, "Falha em zmq_bind(%s): %s\n", endpoint, zmq_strerror(errno));
        goto cleanup;
    }

    if (strncmp(endpoint, "ipc://", 6) == 0) {
        ipc_path = endpoint + 6;
        if (chmod(ipc_path, 0666) != 0)
            fprintf(stderr, "Aviso: chmod 0666 em %s falhou: %s\n",
                    ipc_path, strerror(errno));
    }

    /*2. BPF */
    skel = flow_monitor_bpf__open_and_load();
    if (!skel) {
        fprintf(stderr, "Falha ao carregar BPF: %s\n", strerror(errno));
        goto cleanup;
    }

    prog_fd = bpf_program__fd(skel->progs.tc_flow_monitor);
    map_fd = bpf_map__fd(skel->maps.flow_map);

    if (attach_tc(&hook_in, &opts_in, ifindex, BPF_TC_INGRESS, prog_fd, &qdisc_created) != 0)
        goto cleanup;
    attached_in = true;

    if (attach_tc(&hook_eg, &opts_eg, ifindex, BPF_TC_EGRESS, prog_fd, &qdisc_created) != 0)
        goto cleanup;
    attached_eg = true;

    printf("Programa TC anexado a %s (ingress + egress).\n", ifname);
    printf("A publicar snapshots em %s (topico \"%s\") a cada %d ms. Ctrl+C para parar.\n",
           endpoint, ZMQ_TOPIC, interval_ms);
    fflush(stdout);

    /*3. Loop principal */
    while (running) {
        publish_snapshot(pub, map_fd);
        usleep((useconds_t)interval_ms * 1000);
    }

    printf("\nA parar.\n");
    ret = 0;

cleanup:
    if (attached_eg)
        detach_tc(&hook_eg, &opts_eg);
    if (attached_in)
        detach_tc(&hook_in, &opts_in);
        
    if (qdisc_created)
        bpf_tc_hook_destroy(&hook_in);

    if (skel)
        flow_monitor_bpf__destroy(skel);
    if (pub)
        zmq_close(pub);
    if (ctx)
        zmq_ctx_destroy(ctx);
    if (ipc_path)
        unlink(ipc_path);

    return ret;
}
