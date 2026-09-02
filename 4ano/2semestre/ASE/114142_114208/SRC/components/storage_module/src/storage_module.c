#include "storage_module.h"
#include "hw_config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>
#include "esp_vfs_fat.h"
#include "sdmmc_cmd.h"
#include "esp_log.h"
#include "freertos/task.h"

static const char *TAG = "STORAGE";

#define SD_MOUNT_POINT  "/sdcard"
#define SD_LOG_PATH     SD_MOUNT_POINT "/logs.csv"
#define SD_CFG_PATH     SD_MOUNT_POINT "/config.csv"

static sdmmc_card_t *s_sd_card = NULL;
static bool          s_sd_ok   = false;

/* Define o fuso horario e monta o cartao SD por SPI. */
esp_err_t storage_init(void)
{
    /* Fuso horario de Portugal continental (auto verao/inverno) para os logs.
       Aplica-se a todos os arranques (inclui wake de deep sleep). */
    setenv("TZ", "WET0WEST,M3.5.0/1,M10.5.0", 1);
    tzset();

    sdmmc_host_t host = SDSPI_HOST_DEFAULT();
    spi_bus_config_t bus_cfg = {
        .mosi_io_num     = HW_SPI_MOSI_GPIO,
        .miso_io_num     = HW_SPI_MISO_GPIO,
        .sclk_io_num     = HW_SPI_SCLK_GPIO,
        .quadwp_io_num   = -1,
        .quadhd_io_num   = -1,
        .max_transfer_sz = 4000,
    };
    esp_err_t ret = spi_bus_initialize(host.slot, &bus_cfg, SDSPI_DEFAULT_DMA);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "SPI bus init failed: %s", esp_err_to_name(ret));
        return ret;
    }

    sdspi_device_config_t slot_cfg = SDSPI_DEVICE_CONFIG_DEFAULT();
    slot_cfg.gpio_cs = HW_SD_CS_GPIO;
    slot_cfg.host_id = host.slot;

    esp_vfs_fat_sdmmc_mount_config_t mount_cfg = {
        .format_if_mount_failed = false,
        .max_files              = 4,
        .allocation_unit_size   = 16 * 1024,
    };
    ret = esp_vfs_fat_sdspi_mount(SD_MOUNT_POINT, &host, &slot_cfg, &mount_cfg, &s_sd_card);
    if (ret != ESP_OK)
        ESP_LOGE(TAG, "Mount failed: %s", esp_err_to_name(ret));
    else {
        ESP_LOGI(TAG, "SD mounted at %s", SD_MOUNT_POINT);
        s_sd_ok = true;
    }
    return ret;
}

/* Le config.csv linha a linha e sobrepoe os campos correspondentes em *io. */
esp_err_t storage_load_config(app_config_t *io)
{
    FILE *f = fopen(SD_CFG_PATH, "r");
    if (!f) { ESP_LOGW(TAG, "config.csv ausente, usando defaults"); return ESP_ERR_NOT_FOUND; }

    char line[64];
    fgets(line, sizeof(line), f);   /* salta cabeçalho */
    while (fgets(line, sizeof(line), f)) {
        char key[32], val[32];
        if (sscanf(line, "%31[^,],%31s", key, val) != 2) continue;
        if      (strcmp(key, "t_max")       == 0) io->t_max         = strtof(val, NULL);
        else if (strcmp(key, "t_min")       == 0) io->t_min         = strtof(val, NULL);
        else if (strcmp(key, "deep_sleep")  == 0) io->deep_sleep    = (strcmp(val, "on") == 0);
        else if (strcmp(key, "wifi")        == 0) io->wifi          = (strcmp(val, "on") == 0);
        else if (strcmp(key, "system_on")   == 0) io->system_on     = (strcmp(val, "on") == 0);
        else if (strcmp(key, "leitura_s")   == 0) io->read_interval = atoi(val);
    }
    fclose(f);
    ESP_LOGI(TAG, "Config: t_max=%.1f t_min=%.1f deep_sleep=%d wifi=%d",
             io->t_max, io->t_min, io->deep_sleep, io->wifi);
    return ESP_OK;
}

/* Reescreve por completo o config.csv com os valores atuais. */
esp_err_t storage_save_config(const app_config_t *cfg)
{
    FILE *f = fopen(SD_CFG_PATH, "w");
    if (!f) { ESP_LOGE(TAG, "Falha a escrever config.csv"); return ESP_FAIL; }
    fprintf(f, "parametro,valor\n");
    fprintf(f, "t_max,%.1f\n",    cfg->t_max);
    fprintf(f, "t_min,%.1f\n",    cfg->t_min);
    fprintf(f, "deep_sleep,%s\n", cfg->deep_sleep ? "on" : "off");
    fprintf(f, "wifi,%s\n",       cfg->wifi       ? "on" : "off");
    fprintf(f, "system_on,%s\n",  cfg->system_on  ? "on" : "off");
    fprintf(f, "leitura_s,%d\n",  cfg->read_interval);
    fclose(f);
    ESP_LOGI(TAG, "config.csv guardado");
    return ESP_OK;
}

/* Anexa uma linha a logs.csv (cria o cabecalho se o ficheiro ainda nao existir). */
static void log_append(const sensor_data_t *data, const app_config_t *cfg, const char *evento)
{
    struct stat st;
    bool new_file = (stat(SD_LOG_PATH, &st) != 0);

    FILE *f = fopen(SD_LOG_PATH, "a");
    if (!f) { ESP_LOGE(TAG, "Falha a abrir logs.csv"); return; }

    if (new_file) fprintf(f, "timestamp,temperatura,estado,evento\n");

    const char *estado;
    if      (data->temperature > cfg->t_max) estado = "arrefecendo";
    else if (data->temperature < cfg->t_min) estado = "aquecendo";
    else                                     estado = "conforto";

    /* Hora real (SNTP sincronizado no boot). Se ainda nao sincronizou,
       time() devolve uma data ~1970, sinal claro de "sem hora". */
    time_t now = time(NULL);
    struct tm ti;
    char ts[24];
    localtime_r(&now, &ti);
    strftime(ts, sizeof(ts), "%Y-%m-%d %H:%M:%S", &ti);

    fprintf(f, "%s,%.1f,%s,%s\n", ts, data->temperature, estado, evento);
    fclose(f);
}

/* Apaga o ficheiro logs.csv. */
esp_err_t storage_clear_logs(void)
{
    if (remove(SD_LOG_PATH) != 0) {
        ESP_LOGW(TAG, "logs.csv ausente ou erro ao apagar");
        return ESP_FAIL;
    }
    ESP_LOGI(TAG, "logs.csv apagado");
    return ESP_OK;
}

/* Le as ultimas n_lines do logs.csv (ring buffer) e formata-as como linhas
   de tabela HTML para a pagina web. */
void storage_read_last_logs(char *buf, size_t buf_size, int n_lines)
{
#define MAX_LOG_LINE 128
    char lines[10][MAX_LOG_LINE];
    int  count = 0;

    FILE *f = fopen(SD_LOG_PATH, "r");
    if (!f) {
        strlcpy(buf, "<tr><td colspan='4'>Sem registos</td></tr>", buf_size);
        return;
    }

    char tmp[MAX_LOG_LINE];
    fgets(tmp, sizeof(tmp), f);   /* salta cabeçalho */
    while (fgets(tmp, sizeof(tmp), f)) {
        tmp[strcspn(tmp, "\r\n")] = '\0';
        int slot = count % n_lines;
        strlcpy(lines[slot], tmp, MAX_LOG_LINE);
        count++;
    }
    fclose(f);

    if (count == 0) {
        strlcpy(buf, "<tr><td colspan='4'>Sem registos</td></tr>", buf_size);
        return;
    }

    int    total = count < n_lines ? count : n_lines;
    int    start = count < n_lines ? 0 : (count % n_lines);
    size_t used  = 0;

    for (int i = 0; i < total && used < buf_size - 1; i++) {
        const char *line = lines[(start + i) % n_lines];
        char ts[24]="", temp[12]="", state[20]="", ev[32]="";
        sscanf(line, "%23[^,],%11[^,],%19[^,],%31s", ts, temp, state, ev);
        int n = snprintf(buf + used, buf_size - used,
                         "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
                         ts, temp, state, ev);
        if (n > 0) used += (size_t)n;
    }
    buf[used] = '\0';
#undef MAX_LOG_LINE
}

/* Task de persistencia: consome pedidos da queue e escreve no SD (log/config/clear). */
void storage_task(void *arg)
{
    QueueHandle_t persist_queue = (QueueHandle_t)arg;

    while (1) {
        persist_msg_t msg;
        if (xQueueReceive(persist_queue, &msg, portMAX_DELAY) != pdTRUE) continue;
        if (!s_sd_ok) continue;

        switch (msg.type) {
            case PERSIST_LOG:
                log_append(&msg.reading, &msg.config, msg.evento);
                break;
            case PERSIST_SAVE_CONFIG:
                storage_save_config(&msg.config);
                log_append(&msg.reading, &msg.config, msg.evento);
                break;
            case PERSIST_CLEAR_LOGS:
                storage_clear_logs();
                break;
        }
    }
}
