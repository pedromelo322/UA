#include "https_module.h"
#include "storage_module.h"
#include "controller_module.h"
#include "app_state.h"
#include "sensor_module.h"
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include "esp_log.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_netif.h"
#include "esp_netif_sntp.h"
#include "esp_https_server.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"

static const char *TAG = "HTTPS";

#define STA_SSID       "POCO X6 5G"
#define STA_PASS       "123456789"
#define STA_MAX_RETRY  5

#define WIFI_CONNECTED_BIT  BIT0
#define WIFI_FAIL_BIT       BIT1

static httpd_handle_t     s_http_server = NULL;
static esp_netif_t       *s_sta_netif   = NULL;
static EventGroupHandle_t s_wifi_eg     = NULL;
static int                s_retry_num   = 0;
static bool               s_wifi_running = false;   /* wifi init+start em curso */

/* Envia uma config (com 1 campo alterado) ao controller para aplicar+gravar. */
static void post_config(const app_config_t *cfg, const char *evento)
{
    controller_cmd_t cmd = { .type = CTRL_CMD_SET_CONFIG, .persist = true, .config = *cfg };
    snprintf(cmd.evento, sizeof(cmd.evento), "%s", evento);
    controller_post(&cmd);
}

bool https_get_system_on(void)
{
    app_config_t c; app_state_get_config(&c);
    return c.system_on;
}
void https_set_system_on(bool v)
{
    app_config_t c; app_state_get_config(&c);
    c.system_on = v;
    post_config(&c, "system_set_web");
}

esp_err_t https_module_init(void)
{
    return ESP_OK;
}

/* Replace first occurrence of key in buf (in-place, buf_size is total capacity) */
static void str_replace_once(char *buf, size_t buf_size,
                              const char *key, const char *value)
{
    char *pos = strstr(buf, key);
    if (!pos) return;

    size_t key_len  = strlen(key);
    size_t val_len  = strlen(value);
    size_t buf_used = strlen(buf);
    size_t tail_len = buf_used - (size_t)(pos - buf) - key_len;

    if (buf_used - key_len + val_len + 1 > buf_size) return;

    memmove(pos + val_len, pos + key_len, tail_len + 1);
    memcpy(pos, value, val_len);
}

/* GET / */
static esp_err_t http_handler_root(httpd_req_t *req)
{
    extern const char index_html_start[] asm("_binary_index_https_html_start");
    extern const char index_html_end[]   asm("_binary_index_https_html_end");
    size_t tmpl_len = (size_t)(index_html_end - index_html_start);

    app_state_t st;
    app_state_get(&st);
    sensor_data_t sensor = st.last_reading;

    const char *state_str;
    if      (!st.config.system_on)                     state_str = "DESLIGADO";
    else if (sensor.temperature > st.config.t_max)     state_str = "ARREFECENDO";
    else if (sensor.temperature < st.config.t_min)     state_str = "AQUECENDO";
    else                                               state_str = "CONFORTO";

    char *log_rows = malloc(2048);
    if (!log_rows) { httpd_resp_send_500(req); return ESP_FAIL; }
    storage_read_last_logs(log_rows, 2048, 10);

    /* allocate output: template + room for dynamic content */
    size_t out_size = tmpl_len + 2048 + 256;
    char  *html     = malloc(out_size);
    if (!html) { free(log_rows); httpd_resp_send_500(req); return ESP_FAIL; }
    memcpy(html, index_html_start, tmpl_len);
    html[tmpl_len] = '\0';

    char tmp[32];
    snprintf(tmp, sizeof(tmp), "%.1f", sensor.temperature);
    str_replace_once(html, out_size, "{TEMP}", tmp);

    snprintf(tmp, sizeof(tmp), "%.1f", sensor.humidity);
    str_replace_once(html, out_size, "{HUM}", tmp);

    str_replace_once(html, out_size, "{STATE}", state_str);

    snprintf(tmp, sizeof(tmp), "%.1f", st.config.t_max);
    str_replace_once(html, out_size, "{TMAX}", tmp);

    snprintf(tmp, sizeof(tmp), "%.1f", st.config.t_min);
    str_replace_once(html, out_size, "{TMIN}", tmp);

    snprintf(tmp, sizeof(tmp), "%d", st.config.read_interval);
    str_replace_once(html, out_size, "{INTERVAL}", tmp);

    str_replace_once(html, out_size, "{BTN_CLASS}", st.config.system_on ? "btn-on"  : "btn-off");
    str_replace_once(html, out_size, "{BTN_TEXT}",  st.config.system_on ? "ON"      : "OFF");
    str_replace_once(html, out_size, "{LOGS}", log_rows);

    httpd_resp_set_type(req, "text/html");
    httpd_resp_send(req, html, HTTPD_RESP_USE_STRLEN);
    free(html);
    free(log_rows);
    return ESP_OK;
}

/* GET /api/status */
static esp_err_t http_handler_api_status(httpd_req_t *req)
{
    app_state_t st;
    app_state_get(&st);
    sensor_data_t sensor = st.last_reading;

    const char *state_str;
    if      (!st.config.system_on)                 state_str = "desligado";
    else if (sensor.temperature > st.config.t_max) state_str = "arrefecendo";
    else if (sensor.temperature < st.config.t_min) state_str = "aquecendo";
    else                                           state_str = "conforto";

    char buf[256];
    snprintf(buf, sizeof(buf),
             "{\"temperature\":%.2f,\"humidity\":%.2f,"
             "\"state\":\"%s\",\"t_max\":%.1f,\"t_min\":%.1f,\"system_on\":%s}",
             sensor.temperature, sensor.humidity, state_str,
             st.config.t_max, st.config.t_min,
             st.config.system_on ? "true" : "false");

    httpd_resp_set_type(req, "application/json");
    httpd_resp_send(req, buf, HTTPD_RESP_USE_STRLEN);
    return ESP_OK;
}

/* GET /api/config */
static esp_err_t http_handler_api_config_get(httpd_req_t *req)
{
    app_config_t cfg;
    app_state_get_config(&cfg);
    char buf[160];
    snprintf(buf, sizeof(buf),
             "{\"t_max\":%.1f,\"t_min\":%.1f,\"deep_sleep\":%s,\"wifi\":%s,\"leitura_s\":%d}",
             cfg.t_max, cfg.t_min,
             cfg.deep_sleep ? "true" : "false",
             cfg.wifi       ? "true" : "false",
             cfg.read_interval);

    httpd_resp_set_type(req, "application/json");
    httpd_resp_send(req, buf, HTTPD_RESP_USE_STRLEN);
    return ESP_OK;
}

/* POST /api/config */
static esp_err_t http_handler_api_config_post(httpd_req_t *req)
{
    char body[256] = {0};
    int received = httpd_req_recv(req, body, sizeof(body) - 1);
    if (received <= 0) { httpd_resp_send_500(req); return ESP_FAIL; }
    body[received] = '\0';

    app_config_t cfg;
    app_state_get_config(&cfg);

    float val;
    char *p;

    p = strstr(body, "\"t_max\"");
    if (p && sscanf(p + 7, " : %f", &val) == 1) cfg.t_max = val;

    p = strstr(body, "\"t_min\"");
    if (p && sscanf(p + 7, " : %f", &val) == 1) cfg.t_min = val;

    if (cfg.t_max > 60.0f)  cfg.t_max = 60.0f;
    if (cfg.t_max < -20.0f) cfg.t_max = -20.0f;
    if (cfg.t_min > 60.0f)  cfg.t_min = 60.0f;
    if (cfg.t_min < -20.0f) cfg.t_min = -20.0f;
    if (cfg.t_max < cfg.t_min + 2.0f) {
        httpd_resp_set_type(req, "application/json");
        httpd_resp_sendstr(req, "{\"ok\":false,\"err\":\"gap_min_2\"}");
        return ESP_OK;
    }

    p = strstr(body, "\"deep_sleep\"");
    if (p) {
        if (strstr(p + 12, "true"))  cfg.deep_sleep = true;
        if (strstr(p + 12, "false")) cfg.deep_sleep = false;
    }

    p = strstr(body, "\"leitura_s\"");
    if (p) {
        int ival;
        if (sscanf(p + 11, " : %d", &ival) == 1 && ival >= 5 && ival <= 300)
            cfg.read_interval = ival;
    }

    post_config(&cfg, "config_web");

    httpd_resp_set_type(req, "application/json");
    httpd_resp_sendstr(req, "{\"ok\":true}");
    return ESP_OK;
}

/* POST /api/logs/clear */
static esp_err_t http_handler_logs_clear(httpd_req_t *req)
{
    controller_cmd_t cmd = { .type = CTRL_CMD_CLEAR_LOGS };
    snprintf(cmd.evento, sizeof(cmd.evento), "clear_logs_web");
    controller_post(&cmd);
    ESP_LOGI(TAG, "Pedido de limpeza de logs recebido");

    httpd_resp_set_type(req, "application/json");
    httpd_resp_sendstr(req, "{\"ok\":true}");
    return ESP_OK;
}

/* GET /api/logs */
static esp_err_t http_handler_api_logs_get(httpd_req_t *req)
{
    char *log_rows = malloc(2048);
    if (!log_rows) { httpd_resp_send_500(req); return ESP_FAIL; }
    storage_read_last_logs(log_rows, 2048, 10);
    httpd_resp_set_type(req, "text/html");
    httpd_resp_send(req, log_rows, HTTPD_RESP_USE_STRLEN);
    free(log_rows);
    return ESP_OK;
}

/* POST /api/control */
static esp_err_t http_handler_control_post(httpd_req_t *req)
{
    controller_cmd_t cmd = { .type = CTRL_CMD_TOGGLE_SYSTEM, .persist = true };
    snprintf(cmd.evento, sizeof(cmd.evento), "system_toggle_web");
    controller_post(&cmd);
    ESP_LOGI(TAG, "Sistema remoto: toggle pedido");

    httpd_resp_set_status(req, "303 See Other");
    httpd_resp_set_hdr(req, "Location", "/");
    httpd_resp_send(req, NULL, 0);
    return ESP_OK;
}

static void wifi_sta_event_handler(void *arg, esp_event_base_t event_base,
                                    int32_t event_id, void *event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        if (s_retry_num < STA_MAX_RETRY) {
            esp_wifi_connect();
            s_retry_num++;
        } else {
            xEventGroupSetBits(s_wifi_eg, WIFI_FAIL_BIT);
        }
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *ev = (ip_event_got_ip_t *)event_data;
        ESP_LOGI(TAG, "IP obtido: " IPSTR, IP2STR(&ev->ip_info.ip));
        s_retry_num = 0;
        xEventGroupSetBits(s_wifi_eg, WIFI_CONNECTED_BIT);
    }
}

static void wifi_sta_start(void)
{
    if (s_wifi_running) return;                /* idempotente */
    s_wifi_eg   = xEventGroupCreate();
    s_sta_netif = esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(
        WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_sta_event_handler, NULL, NULL));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(
        IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_sta_event_handler, NULL, NULL));

    wifi_config_t wifi_cfg = {
        .sta = {
            .ssid     = STA_SSID,
            .password = STA_PASS,
            .threshold.authmode = WIFI_AUTH_WPA2_PSK,
        },
    };
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_cfg));
    ESP_ERROR_CHECK(esp_wifi_start());

    EventBits_t bits = xEventGroupWaitBits(s_wifi_eg,
        WIFI_CONNECTED_BIT | WIFI_FAIL_BIT, pdFALSE, pdFALSE, pdMS_TO_TICKS(15000));

    if (bits & WIFI_CONNECTED_BIT) {
        ESP_LOGI(TAG, "Wi-Fi STA ligado a %s", STA_SSID);
    } else {
        ESP_LOGW(TAG, "Falha ao ligar a %s", STA_SSID);
    }
    s_wifi_running = true;
}

static void wifi_sta_stop(void)
{
    if (!s_wifi_running) return;               /* idempotente */
    ESP_ERROR_CHECK(esp_wifi_stop());
    ESP_ERROR_CHECK(esp_wifi_deinit());
    if (s_sta_netif) {
        esp_netif_destroy_default_wifi(s_sta_netif);
        s_sta_netif = NULL;
    }
    if (s_wifi_eg) {
        vEventGroupDelete(s_wifi_eg);
        s_wifi_eg = NULL;
    }
    s_retry_num = 0;
    s_wifi_running = false;
    ESP_LOGI(TAG, "Wi-Fi STA parado");
}

/* Sincroniza o relogio via SNTP (requer Wi-Fi ja ligado). */
static void obtain_time_sntp(void)
{
    esp_sntp_config_t cfg = ESP_NETIF_SNTP_DEFAULT_CONFIG("pool.ntp.org");
    if (esp_netif_sntp_init(&cfg) != ESP_OK) {
        ESP_LOGW(TAG, "SNTP init falhou");
        return;
    }
    if (esp_netif_sntp_sync_wait(pdMS_TO_TICKS(10000)) == ESP_OK) {
        time_t now = time(NULL);
        struct tm ti;
        char buf[32];
        localtime_r(&now, &ti);
        strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", &ti);
        ESP_LOGI(TAG, "Hora sincronizada (SNTP): %s", buf);
    } else {
        ESP_LOGW(TAG, "SNTP timeout - hora nao sincronizada");
    }
    esp_netif_sntp_deinit();
}

/* Boot (cold start): liga Wi-Fi temporariamente so para buscar a hora real,
   depois respeita a config de Wi-Fi (desliga se estiver OFF). */
void https_module_boot_sync(void)
{
    ESP_LOGI(TAG, "Boot: a ligar Wi-Fi para sincronizar hora...");
    wifi_sta_start();                          /* sempre, independente da config */
    obtain_time_sntp();

    app_config_t cfg; app_state_get_config(&cfg);
    if (!cfg.wifi) {
        ESP_LOGI(TAG, "Config Wi-Fi=OFF -> a desligar Wi-Fi apos sync");
        wifi_sta_stop();
    }
    /* se config Wi-Fi=ON, deixa ligado; a https_task arranca o servidor */
}

static void http_server_start(void)
{
    if (s_http_server) return;                 /* idempotente */
    httpd_ssl_config_t conf = HTTPD_SSL_CONFIG_DEFAULT();
    conf.httpd.stack_size = 8192;

    extern const unsigned char servercert_pem_start[] asm("_binary_servercert_pem_start");
    extern const unsigned char servercert_pem_end[]   asm("_binary_servercert_pem_end");
    conf.servercert     = servercert_pem_start;
    conf.servercert_len = servercert_pem_end - servercert_pem_start;

    extern const unsigned char prvtkey_pem_start[] asm("_binary_prvtkey_pem_start");
    extern const unsigned char prvtkey_pem_end[]   asm("_binary_prvtkey_pem_end");
    conf.prvtkey_pem = prvtkey_pem_start;
    conf.prvtkey_len = prvtkey_pem_end - prvtkey_pem_start;

    esp_err_t ret = httpd_ssl_start(&s_http_server, &conf);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao iniciar servidor: %s", esp_err_to_name(ret));
        return;
    }

    static const httpd_uri_t uri_root = {
        .uri = "/", .method = HTTP_GET, .handler = http_handler_root };
    static const httpd_uri_t uri_status = {
        .uri = "/api/status", .method = HTTP_GET, .handler = http_handler_api_status };
    static const httpd_uri_t uri_cfg_get = {
        .uri = "/api/config", .method = HTTP_GET, .handler = http_handler_api_config_get };
    static const httpd_uri_t uri_cfg_post = {
        .uri = "/api/config", .method = HTTP_POST, .handler = http_handler_api_config_post };
    static const httpd_uri_t uri_ctrl = {
        .uri = "/api/control", .method = HTTP_POST, .handler = http_handler_control_post };
    static const httpd_uri_t uri_logs_clear = {
        .uri = "/api/logs/clear", .method = HTTP_POST, .handler = http_handler_logs_clear };
    static const httpd_uri_t uri_logs_get = {
        .uri = "/api/logs", .method = HTTP_GET, .handler = http_handler_api_logs_get };

    httpd_register_uri_handler(s_http_server, &uri_root);
    httpd_register_uri_handler(s_http_server, &uri_status);
    httpd_register_uri_handler(s_http_server, &uri_cfg_get);
    httpd_register_uri_handler(s_http_server, &uri_cfg_post);
    httpd_register_uri_handler(s_http_server, &uri_ctrl);
    httpd_register_uri_handler(s_http_server, &uri_logs_clear);
    httpd_register_uri_handler(s_http_server, &uri_logs_get);

    ESP_LOGI(TAG, "Servidor HTTPS iniciado (porta 443)");
}

static void http_server_stop(void)
{
    if (s_http_server) {
        httpd_ssl_stop(s_http_server);
        s_http_server = NULL;
        ESP_LOGI(TAG, "Servidor HTTPS parado");
    }
}

void https_task(void *arg)
{
    bool running = false;

    /* estado inicial: aplicar config já carregada do SD.
       (wifi_sta_start/stop sao idempotentes — no cold boot o Wi-Fi pode
        ja estar ligado pelo https_module_boot_sync se a config for ON) */
    app_config_t cfg; app_state_get_config(&cfg);
    if (cfg.wifi) {
        wifi_sta_start();
        http_server_start();
        running = true;
    } else {
        wifi_sta_stop();
    }

    while (1) {
        /* Poll de 1 s ao estado: arranca/para Wi-Fi quando a config muda. */
        vTaskDelay(pdMS_TO_TICKS(1000));

        app_config_t c; app_state_get_config(&c);
        bool want_wifi = c.wifi;
        if (want_wifi && !running) {
            wifi_sta_start();
            http_server_start();
            running = true;
        } else if (!want_wifi && running) {
            http_server_stop();
            wifi_sta_stop();
            running = false;
        }
    }
}
