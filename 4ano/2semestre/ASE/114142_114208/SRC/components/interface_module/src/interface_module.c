#include "interface_module.h"
#include "hw_config.h"
#include "st7735.h"
#include "driver/gpio.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_log.h"
#include "esp_timer.h"
#include "esp_sleep.h"
#include "freertos/task.h"

static const char *TAG = "UI";

#define BUTTON_DEBOUNCE_US  500000
#define UI_TIMEOUT_MS       10000

#define POT_MOVE_THRESHOLD  100
#define POT_ADC_MIN         50
#define POT_ADC_MAX         3800   /* ajustar se T_MAX ainda não aparecer — medir raw real */

static QueueHandle_t           s_button_queue = NULL;
static adc_oneshot_unit_handle_t s_adc_handle = NULL;
static bool                    s_tft_ok       = false;
static int                     s_scroll_offset = 0;

/* ISR do botao: so empurra o GPIO para a queue; o debounce e tratado na task. */
static void IRAM_ATTR button_isr_handler(void *arg)
{
    uint32_t gpio_num = (uint32_t)(uintptr_t)arg;
    xQueueSendFromISR(s_button_queue, &gpio_num, NULL);
}

/* Configura botao (IRQ), ADC do potenciometro e o display TFT. */
esp_err_t interface_init(QueueHandle_t button_queue, QueueHandle_t pot_queue)
{
    (void)pot_queue;
    s_button_queue = button_queue;

    /* Button GPIO */
    gpio_config_t btn_cfg = {
        .pin_bit_mask  = 1ULL << HW_BUTTON_GPIO,
        .mode          = GPIO_MODE_INPUT,
        .pull_up_en    = GPIO_PULLUP_ENABLE,
        .pull_down_en  = GPIO_PULLDOWN_DISABLE,
        .intr_type     = GPIO_INTR_NEGEDGE,
    };
    ESP_ERROR_CHECK(gpio_config(&btn_cfg));
    ESP_ERROR_CHECK(gpio_install_isr_service(0));
    ESP_ERROR_CHECK(gpio_isr_handler_add(HW_BUTTON_GPIO, button_isr_handler,
                                         (void *)(uintptr_t)HW_BUTTON_GPIO));

    /* Potentiometer ADC */
    adc_oneshot_unit_init_cfg_t init_cfg = { .unit_id = ADC_UNIT_1 };
    ESP_ERROR_CHECK(adc_oneshot_new_unit(&init_cfg, &s_adc_handle));
    adc_oneshot_chan_cfg_t chan_cfg = {
        .atten    = ADC_ATTEN_DB_12,
        .bitwidth = ADC_BITWIDTH_DEFAULT,
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(s_adc_handle, HW_POT_ADC_CHANNEL, &chan_cfg));

    /* TFT display */
    st7735_config_t tft_cfg = {
        .mosi_io_num = HW_SPI_MOSI_GPIO,
        .sclk_io_num = HW_SPI_SCLK_GPIO,
        .cs_io_num   = HW_TFT_CS_GPIO,
        .dc_io_num   = HW_TFT_DC_GPIO,
        .rst_io_num  = HW_TFT_RST_GPIO,
        .bl_io_num   = HW_TFT_BL_GPIO,
        .host_id     = SPI2_HOST,
    };
    if (st7735_init(&tft_cfg) != ESP_OK) {
        ESP_LOGE(TAG, "Falha na inicializacao do display");
        return ESP_OK;   /* não fatal — sistema continua sem display */
    }
    s_tft_ok = true;
    st7735_set_rotation(3);
    st7735_fill_screen(ST7735_BLACK);
    st7735_draw_string(20,  8, "ASE Clima", ST7735_CYAN,  ST7735_BLACK, 2);
    st7735_draw_string(20, 40, "ESP32-C6",  ST7735_WHITE, ST7735_BLACK, 2);
    vTaskDelay(pdMS_TO_TICKS(1000));

    return ESP_OK;
}

/* ---- TFT render helpers ---- */

/* Ecra principal: temperatura, humidade e estado termico (cor por estado). */
static void tft_show_display(const sensor_data_t *d)
{
    if (!s_tft_ok) return;

    uint16_t   state_color;
    const char *state_str;
    app_config_t cfg;
    app_state_get_config(&cfg);
    float t_max = cfg.t_max;
    float t_min = cfg.t_min;

    if      (d->temperature > t_max) { state_color = ST7735_BLUE;  state_str = "ARREFECENDO"; }
    else if (d->temperature < t_min) { state_color = ST7735_RED;   state_str = "AQUECENDO";   }
    else                             { state_color = ST7735_GREEN; state_str = "CONFORTO";    }

    char buf[32];
    st7735_fill_screen(ST7735_BLACK);
    st7735_draw_string(0, 0, "CLIMA ESP32", ST7735_CYAN, ST7735_BLACK, 1);
    st7735_fill_rect(0, 9, 160, 1, ST7735_BLUE);

    snprintf(buf, sizeof(buf), "%.1f C", d->temperature);
    st7735_draw_string(0, 14, buf, ST7735_WHITE, ST7735_BLACK, 2);

    snprintf(buf, sizeof(buf), "Hum: %.1f%%", d->humidity);
    st7735_draw_string(0, 46, buf, ST7735_GRAY, ST7735_BLACK, 1);

    st7735_draw_string(0, 56, state_str, state_color, ST7735_BLACK, 1);
}

/* Lista do menu com scroll: realca a opcao selecionada e mostra o valor atual. */
static void tft_show_menu(menu_item_t selected)
{
    if (!s_tft_ok) return;

#define MENU_VISIBLE 5

    if ((int)selected < s_scroll_offset)
        s_scroll_offset = (int)selected;
    if ((int)selected >= s_scroll_offset + MENU_VISIBLE)
        s_scroll_offset = (int)selected - MENU_VISIBLE + 1;

    char buf[24];
    app_config_t cfg;
    app_state_get_config(&cfg);
    st7735_fill_screen(ST7735_BLACK);
    st7735_draw_string(0, 0, "-- MENU --", ST7735_CYAN, ST7735_BLACK, 1);

    for (int i = s_scroll_offset; i < s_scroll_offset + MENU_VISIBLE && i < MENU_COUNT; i++) {
        uint16_t y      = 12 + (i - s_scroll_offset) * 12;
        bool     is_sel = (i == (int)selected);
        uint16_t fg     = is_sel ? ST7735_BLACK  : ST7735_WHITE;
        uint16_t bg     = is_sel ? ST7735_YELLOW : ST7735_BLACK;

        if (is_sel) st7735_fill_rect(0, y, 160, 12, ST7735_YELLOW);

        switch (i) {
            case MENU_T_MAX:
                snprintf(buf, sizeof(buf), "T.Max: %.1f C",     cfg.t_max); break;
            case MENU_T_MIN:
                snprintf(buf, sizeof(buf), "T.Min: %.1f C",     cfg.t_min); break;
            case MENU_DEEP_SLEEP:
                snprintf(buf, sizeof(buf), "DeepSlp: %s", cfg.deep_sleep ? "ON" : "OFF"); break;
            case MENU_WIFI:
                snprintf(buf, sizeof(buf), "Wi-Fi: %s",   cfg.wifi       ? "ON" : "OFF"); break;
            case MENU_SYSTEM_ON:
                snprintf(buf, sizeof(buf), "Sistema: %s", cfg.system_on  ? "ON" : "OFF"); break;
            case MENU_LEITURA_S:
                snprintf(buf, sizeof(buf), "Leitura: %ds", cfg.read_interval); break;
            case MENU_SAIR:
                snprintf(buf, sizeof(buf), "Sair"); break;
            default: break;
        }
        st7735_draw_string(2, y + 2, buf, fg, bg, 1);
    }
}

/* Valores em edicao, ainda nao confirmados (so vao para a config ao confirmar). */
typedef struct {
    float t_max;
    float t_min;
    bool  deep_sleep;
    bool  wifi;
    bool  system_on;
    int   leitura_s;
} pending_config_t;

/* Ecra de edicao: nome da opcao + valor pendente em destaque. */
static void tft_show_editar(menu_item_t item, const pending_config_t *p)
{
    if (!s_tft_ok) return;

    static const char *names[MENU_COUNT] = {
        "T.Maxima", "T.Minima", "DeepSleep", "Wi-Fi", "Sistema", "Leitura"
    };

    char val[16];
    switch (item) {
        case MENU_T_MAX:       snprintf(val, sizeof(val), "%.1f C", p->t_max);                      break;
        case MENU_T_MIN:       snprintf(val, sizeof(val), "%.1f C", p->t_min);                      break;
        case MENU_DEEP_SLEEP:  snprintf(val, sizeof(val), "%s", p->deep_sleep ? "ON" : "OFF");      break;
        case MENU_WIFI:        snprintf(val, sizeof(val), "%s", p->wifi       ? "ON" : "OFF");      break;
        case MENU_SYSTEM_ON:   snprintf(val, sizeof(val), "%s", p->system_on  ? "ON" : "OFF");      break;
        case MENU_LEITURA_S:   snprintf(val, sizeof(val), "%d s", p->leitura_s);                   break;
        default: break;
    }

    st7735_fill_screen(ST7735_BLACK);
    st7735_draw_string(0,  0, "[ EDITAR ]", ST7735_CYAN,   ST7735_BLACK, 1);
    st7735_fill_rect(0, 9, 160, 1, ST7735_CYAN);
    st7735_draw_string(0, 14, names[item], ST7735_WHITE,  ST7735_BLACK, 2);
    st7735_draw_string(0, 36, val,         ST7735_YELLOW, ST7735_BLACK, 2);
}

/* ---- Menu value helpers ---- */

/* Mapeia a posicao do potenciometro para uma opcao do menu. */
static menu_item_t pot_to_menu_item(int raw)
{
    if (raw < POT_ADC_MIN) raw = POT_ADC_MIN;
    if (raw > POT_ADC_MAX) raw = POT_ADC_MAX;
    int idx = ((POT_ADC_MAX - raw) * MENU_COUNT) / (POT_ADC_MAX - POT_ADC_MIN + 1);
    if (idx >= MENU_COUNT) idx = MENU_COUNT - 1;
    return (menu_item_t)idx;
}

/* Mapeia a posicao do potenciometro para um valor no intervalo [lo, hi]. */
static float pot_to_float(int raw, float lo, float hi)
{
    if (raw < POT_ADC_MIN) raw = POT_ADC_MIN;
    if (raw > POT_ADC_MAX) raw = POT_ADC_MAX;
    float t = (float)(POT_ADC_MAX - raw) / (float)(POT_ADC_MAX - POT_ADC_MIN);
    return lo + t * (hi - lo);
}

/* Aplica a posicao do pot ao campo do pending correspondente a opcao a editar. */
static void apply_pot_to_pending(menu_item_t item, int raw, pending_config_t *p)
{
    switch (item) {
        case MENU_T_MAX:
            p->t_max = pot_to_float(raw, p->t_min + 2.0f, 50.0f);
            break;
        case MENU_T_MIN:
            p->t_min = pot_to_float(raw, 0.0f, p->t_max - 2.0f);
            break;
        case MENU_DEEP_SLEEP:
            p->deep_sleep = (raw < 2048);
            break;
        case MENU_WIFI:
            p->wifi = (raw < 2048);
            break;
        case MENU_SYSTEM_ON:
            p->system_on = (raw < 2048);
            break;
        case MENU_LEITURA_S:
            p->leitura_s = (int)pot_to_float(raw, 5.0f, 300.0f);
            break;
        default: break;
    }
}

/* Aplica e persiste o pending enviando um comando ao controller. */
static void commit_pending(const pending_config_t *p, const char *evento)
{
    controller_cmd_t cmd = { .type = CTRL_CMD_SET_CONFIG, .persist = true };
    cmd.config.t_max         = p->t_max;
    cmd.config.t_min         = p->t_min;
    cmd.config.deep_sleep    = p->deep_sleep;
    cmd.config.wifi          = p->wifi;
    cmd.config.system_on     = p->system_on;
    cmd.config.read_interval = p->leitura_s;
    snprintf(cmd.evento, sizeof(cmd.evento), "%s", evento);
    controller_post(&cmd);
}

/* Sinaliza ao controller que o utilizador está (ou não) a navegar o menu,
   para travar o sleep enquanto interage. */
static void set_ui_menu(bool in_menu)
{
    controller_cmd_t cmd = { .type = CTRL_CMD_UI_MENU, .in_menu = in_menu };
    controller_post(&cmd);
}

/* ---- Tasks ---- */

/* Le o pot periodicamente e so publica na queue quando se move o suficiente
   (filtra ruido do ADC para nao inundar a UI). */
void interface_pot_task(void *arg)
{
    QueueHandle_t pot_queue = (QueueHandle_t)arg;
    int prev_raw = -1;

    while (1) {
        int raw;
        adc_oneshot_read(s_adc_handle, HW_POT_ADC_CHANNEL, &raw);

        if (prev_raw < 0 || abs(raw - prev_raw) > POT_MOVE_THRESHOLD) {
            prev_raw = raw;
            xQueueSend(pot_queue, &raw, 0);
        }
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}

/* Task principal da interface: maquina de estados DISPLAY/MENU/EDITAR.
   Espera em simultaneo por botao, pot e novas leituras (queue set), com
   timeout que faz voltar ao DISPLAY apos inatividade. */
void interface_ui_task(void *arg)
{
    interface_ui_args_t *args = (interface_ui_args_t *)arg;

    QueueSetHandle_t queue_set =
        xQueueCreateSet(5 + 5 + 3);   /* BUTTON + POT + DISPLAY queue sizes */
    xQueueAddToSet(args->button_queue,  queue_set);
    xQueueAddToSet(args->pot_queue,     queue_set);
    xQueueAddToSet(args->display_queue, queue_set);

    ui_state_t     ui_state  = UI_DISPLAY;
    menu_item_t    menu_item = MENU_T_MAX;
    int64_t        last_us   = 0;
    sensor_data_t  local_sensor = {0};
    pending_config_t pending = {0};

    /* Wake de Deep Sleep pelo botao → arrancar diretamente no MENU.
       (em vez de injetar evento no button_queue, que seria comido pelo debounce no boot) */
    if (esp_sleep_get_wakeup_cause() == ESP_SLEEP_WAKEUP_GPIO) {
        int cur_raw;
        adc_oneshot_read(s_adc_handle, HW_POT_ADC_CHANNEL, &cur_raw);
        menu_item = pot_to_menu_item(cur_raw);
        s_scroll_offset = 0;
        set_ui_menu(true);   /* trava o sleep enquanto navega */
        ui_state = UI_MENU;
        ESP_LOGI(TAG, "Wake Deep Sleep (botao) -> MENU");
        tft_show_menu(menu_item);
    } else if (s_tft_ok) {
        tft_show_display(&local_sensor);
    }

    while (1) {
        QueueSetMemberHandle_t active =
            xQueueSelectFromSet(queue_set, pdMS_TO_TICKS(UI_TIMEOUT_MS));

        if (active == NULL) {
            if (ui_state != UI_DISPLAY) {
                if (ui_state == UI_EDITAR) {
                    commit_pending(&pending, "config_timeout");
                }
                set_ui_menu(false);
                ui_state = UI_DISPLAY;
                ESP_LOGI(TAG, "Timeout -> DISPLAY");
                tft_show_display(&local_sensor);
            }
            continue;
        }

        if (active == args->display_queue) {
            xQueueReceive(args->display_queue, &local_sensor, 0);
            if (ui_state == UI_DISPLAY) tft_show_display(&local_sensor);
        }
        else if (active == args->button_queue) {
            uint32_t gpio_num;
            xQueueReceive(args->button_queue, &gpio_num, 0);

            int64_t now = esp_timer_get_time();
            if (now - last_us < BUTTON_DEBOUNCE_US) continue;
            last_us = now;

            /* esvazia bounces acumulados */
            { uint32_t dummy; while (xQueueReceive(args->button_queue, &dummy, 0) == pdTRUE); }

            switch (ui_state) {
                case UI_DISPLAY: {
                    int cur_raw;
                    adc_oneshot_read(s_adc_handle, HW_POT_ADC_CHANNEL, &cur_raw);
                    set_ui_menu(true);
                    ui_state  = UI_MENU;
                    s_scroll_offset = 0;
                    menu_item = pot_to_menu_item(cur_raw);
                    ESP_LOGI(TAG, "DISPLAY -> MENU");
                    tft_show_menu(menu_item);
                    break;
                }
                case UI_MENU:
                    if (menu_item == MENU_SAIR) {
                        set_ui_menu(false);
                        ui_state = UI_DISPLAY;
                        ESP_LOGI(TAG, "MENU -> DISPLAY (sair)");
                        tft_show_display(&local_sensor);
                    } else {
                        /* inicializa pending com os valores atuais */
                        app_config_t cfg;
                        app_state_get_config(&cfg);
                        pending.t_max      = cfg.t_max;
                        pending.t_min      = cfg.t_min;
                        pending.deep_sleep = cfg.deep_sleep;
                        pending.wifi       = cfg.wifi;
                        pending.system_on  = cfg.system_on;
                        pending.leitura_s  = cfg.read_interval;
                        /* aplica posição atual do pot ao pending */
                        int cur_raw;
                        adc_oneshot_read(s_adc_handle, HW_POT_ADC_CHANNEL, &cur_raw);
                        apply_pot_to_pending(menu_item, cur_raw, &pending);
                        ui_state = UI_EDITAR;
                        ESP_LOGI(TAG, "MENU -> EDITAR (item %d)", (int)menu_item);
                        tft_show_editar(menu_item, &pending);
                    }
                    break;
                case UI_EDITAR: {
                    /* confirma: aplica e persiste via controller */
                    commit_pending(&pending, "config_salva");
                    int cur_raw;
                    adc_oneshot_read(s_adc_handle, HW_POT_ADC_CHANNEL, &cur_raw);
                    ui_state  = UI_MENU;
                    menu_item = pot_to_menu_item(cur_raw);
                    ESP_LOGI(TAG, "EDITAR -> MENU");
                    tft_show_menu(menu_item);
                    break;
                }
            }
        }
        else if (active == args->pot_queue) {
            int raw;
            xQueueReceive(args->pot_queue, &raw, 0);

            if (ui_state == UI_MENU) {
                menu_item = pot_to_menu_item(raw);
                tft_show_menu(menu_item);
            } else if (ui_state == UI_EDITAR) {
                apply_pot_to_pending(menu_item, raw, &pending);
                tft_show_editar(menu_item, &pending);
            }
        }
    }
}
