/**
 * @file flow_monitor.bpf.c
 * @brief eBPF TC program — mantem, por flow bidirecional, o estado minimo que
 *        o orquestrador de servicos precisa de observar: timestamp do ultimo
 *        pacote, numero de pacotes e soma dos tamanhos (a media e o debito sao
 *        derivados em user space). O pacote segue sempre, TC_ACT_OK,
 *        nunca ha acao sobre o trafego.
 *
 */

#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#define TC_ACT_OK   0
#define ETH_P_IP    0x0800
#define IPPROTO_TCP 6
#define IPPROTO_UDP 17

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

/* Mapa dos fluxos ativos; entradas antigas sao recicladas quando fica cheio (LRU). */
struct {
    __uint(type, BPF_MAP_TYPE_LRU_HASH);
    __type(key, struct flow_mon_key);
    __type(value, struct flow_mon_stats);
    __uint(max_entries, 4096);
} flow_map SEC(".maps");

SEC("tc")
int tc_flow_monitor(struct __sk_buff *skb)
{
    // carrega o cabeçalho Ethernet
    struct ethhdr eth;
    if (bpf_skb_load_bytes(skb, 0, &eth, sizeof(eth)) < 0)
        return TC_ACT_OK;

    // só IPv4
    if (eth.h_proto != bpf_htons(ETH_P_IP))
        return TC_ACT_OK;

    // carrega o cabeçalho IP
    struct iphdr iph;
    if (bpf_skb_load_bytes(skb, sizeof(eth), &iph, sizeof(iph)) < 0)
        return TC_ACT_OK;

    if (iph.ihl < 5)
        return TC_ACT_OK;

    // portas só existem para TCP/UDP; outros protocolos ficam a 0
    __u16 sport = 0, dport = 0;
    if (iph.protocol == IPPROTO_TCP || iph.protocol == IPPROTO_UDP) {
        __u16 ports[2];
        __u32 l4_off = sizeof(eth) + iph.ihl * 4;
        if (bpf_skb_load_bytes(skb, l4_off, ports, sizeof(ports)) < 0)
            return TC_ACT_OK;
        sport = bpf_ntohs(ports[0]);
        dport = bpf_ntohs(ports[1]);
    }

    // endpoint menor fica em _a, para os dois sentidos colidirem
    struct flow_mon_key key = {0};
    __u64 endpoint_a = ((__u64)iph.saddr << 16) | sport;
    __u64 endpoint_b = ((__u64)iph.daddr << 16) | dport;
    if (endpoint_a <= endpoint_b) {
        key.ip_a = iph.saddr;
        key.port_a = sport;
        key.ip_b = iph.daddr;
        key.port_b = dport;
    } else {
        key.ip_a = iph.daddr;
        key.port_a = dport;
        key.ip_b = iph.saddr;
        key.port_b = sport;
    }
    key.proto = iph.protocol;

    __u64 pkt_len = skb->len;
    __u64 now = bpf_ktime_get_ns();

    // atualiza o estado do fluxo no mapa ou cria uma nova entrada
    struct flow_mon_stats *stats = bpf_map_lookup_elem(&flow_map, &key);
    if (!stats) {
        struct flow_mon_stats init = {
            .packets      = 1,
            .sum_pkt_size = pkt_len,
            .first_ts_ns  = now,
            .last_ts_ns   = now,
        };
        bpf_map_update_elem(&flow_map, &key, &init, BPF_NOEXIST);
        return TC_ACT_OK;
    }

    stats->packets += 1;
    stats->sum_pkt_size += pkt_len;
    stats->last_ts_ns = now;

    return TC_ACT_OK;
}

char LICENSE[] SEC("license") = "GPL";
