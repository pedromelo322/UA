#include "controller_module.h"
#include "storage_module.h"
#include "led_module.h"
#include "fan_module.h"
#include "hw_config.h"
#include "driver/gpio.h"
#include "esp_sleep.h"
#include "esp_pm.h"
#include "esp_wifi.h"
#include "esp_log.h"
#include "freertos/task.h"

static const char *TAG = "CTRL";

#define CMD_QUEUE_LEN     8
#define IDLE_TIMEOUT_MS   20000   /* reavaliação periódica → light/deep sleep */

static QueueHandle_t s_cmd_q        = NULL;
static QueueHandle_t s_persist_q    = NULL;
static QueueHandle_t s_display_q    = NULL;

static bool         s_in_menu          = false;
static bool         s_light_sleep_on   = false;
static power_mode_t s_last_power_mode  = POWER_ACTIVE;

/* ---------- persistência (delegada à storage_task) ---------- */

static void persist_send(persist_type_t type, const app_state_t *st, const char *evento)
{
    persist_msg_t msg = { .type = type, .reading = st->last_reading, .config = st->config };
    if (evento) snprintf(msg.evento, sizeof(msg.evento), "%s", evento);
    xQueueSend(s_persist_q, &msg, 0);
}

/* ---------- lógica térmica + atuadores ---------- */

static thermal_state_t compute_thermal(const app_state_t *st)
{
    if (!st->config.system_on) return THERMAL_APAGADO;

    float t    = st->last_reading.temperature;
    float tmax = st->config.t_max;
    float tmin = st->config.t_min;

    switch (st->thermal) {
        case THERMAL_ARREFECENDO:
            if (t < tmin)         return THERMAL_AQUECENDO;
            if (t <= tmax - 2.0f) return THERMAL_CONFORTO;
            return THERMAL_ARREFECENDO;
        case THERMAL_AQUECENDO:
            if (t > tmax)         return THERMAL_ARREFECENDO;
            if (t >= tmin + 2.0f) return THERMAL_CONFORTO;
            return THERMAL_AQUECENDO;
        default:
            if (t > tmax) return THERMAL_ARREFECENDO;
            if (t < tmin) return THERMAL_AQUECENDO;
            return THERMAL_CONFORTO;
    }
}

static void drive_actuators(thermal_state_t state)
{
    switch (state) {
        case THERMAL_APAGADO:
            led_set_mode(LED_OFF);   fan_set_cold(0);   fan_set_hot(0);   break;
        case THERMAL_CONFORTO:
            led_set_mode(LED_BLINK); fan_set_cold(0);   fan_set_hot(0);   break;
        case THERMAL_AQUECENDO:
            led_set_mode(LED_ON);    fan_set_cold(0);   fan_set_hot(100); break;
        case THERMAL_ARREFECENDO:
            led_set_mode(LED_ON);    fan_set_cold(100); fan_set_hot(0);   break;
    }
}

/* ---------- modos de energia ---------- */

static void enter_light_sleep(void)
{
    if (s_light_sleep_on) return;
    esp_wifi_stop();
    fan_hold_off();
    gpio_wakeup_enable(HW_BUTTON_GPIO, GPIO_INTR_LOW_LEVEL);
    esp_sleep_enable_gpio_wakeup();
    esp_pm_config_t cfg = {
        .max_freq_mhz       = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ,
        .min_freq_mhz       = 10,
        .light_sleep_enable = true,
    };
    esp_pm_configure(&cfg);
    s_light_sleep_on = true;
    ESP_LOGI(TAG, "Light Sleep ativado");
}

static void exit_light_sleep(void)
{
    if (!s_light_sleep_on) return;
    esp_pm_config_t cfg = {
        .max_freq_mhz       = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ,
        .min_freq_mhz       = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ,
        .light_sleep_enable = false,
    };
    esp_pm_configure(&cfg);
    gpio_wakeup_disable(HW_BUTTON_GPIO);
    fan_release_hold();
    s_light_sleep_on = false;
    ESP_LOGI(TAG, "Light Sleep desativado");
}

static void enter_deep_sleep(int interval_s)
{
    ESP_LOGI(TAG, "A entrar em Deep Sleep");
    esp_wifi_stop();
    fan_hold_off();

    /* Timer RTC: re-le sensor / re-decide ao fim do intervalo de leitura */
    esp_sleep_enable_timer_wakeup((uint64_t)interval_s * 1000000ULL);

    /* Botao: GPIO em nivel baixo (push-button active-low com pull-up) */
    gpio_pullup_en(HW_BUTTON_GPIO);
    esp_deep_sleep_enable_gpio_wakeup(1ULL << HW_BUTTON_GPIO, ESP_GPIO_WAKEUP_GPIO_LOW);

    esp_deep_sleep_start();   /* nao retorna */
}

/* Decide e aplica o modo de energia. Mesma semântica do antigo energy_module. */
static void apply_power_mode(const app_state_t *st)
{
    bool wifi_on       = st->config.wifi;
    bool deep_sleep_on = st->config.deep_sleep;
    bool in_comfort    = (st->thermal == THERMAL_CONFORTO);

    power_mode_t mode;
    bool go_deep_sleep = false;

    if (s_in_menu) {
        exit_light_sleep();
        mode = POWER_ACTIVE;
        if (wifi_on) esp_wifi_set_ps(WIFI_PS_NONE);
    } else if (!in_comfort || wifi_on) {
        exit_light_sleep();
        if (wifi_on) esp_wifi_set_ps(WIFI_PS_MAX_MODEM);
        mode = POWER_MODEM_SLEEP;
    } else if (!deep_sleep_on) {
        enter_light_sleep();
        mode = POWER_LIGHT_SLEEP;
    } else {
        exit_light_sleep();
        mode = POWER_DEEP_SLEEP;
        go_deep_sleep = true;
    }

    app_state_set_power(mode);

    /* Logar apenas quando o modo muda (evita escrever no SD a cada 20 s). */
    if (mode != s_last_power_mode) {
        static const char *names[] = {
            "modo_active", "modo_modem_sleep", "modo_light_sleep", "modo_deep_sleep"
        };
        ESP_LOGI(TAG, "Modo: %s", names[mode]);
        persist_send(PERSIST_LOG, st, names[mode]);
        s_last_power_mode = mode;
    }

    if (go_deep_sleep) {
        vTaskDelay(pdMS_TO_TICKS(300));   /* deixar a storage_task gravar o log */
        enter_deep_sleep(st->config.read_interval);
    }
}

/* Recalcula estado térmico, comanda atuadores e reavalia energia. */
static void reevaluate(void)
{
    app_state_t st;
    app_state_get(&st);

    thermal_state_t thermal = compute_thermal(&st);
    if (thermal != st.thermal) {
        app_state_set_thermal(thermal);
        st.thermal = thermal;
    }
    drive_actuators(thermal);
    apply_power_mode(&st);
}

/* ---------- tratamento de comandos ---------- */

static void push_display(void)
{
    app_state_t st;
    app_state_get(&st);
    xQueueSend(s_display_q, &st.last_reading, 0);
}

static void handle_cmd(const controller_cmd_t *cmd)
{
    switch (cmd->type) {
        case CTRL_CMD_READING: {
            app_state_set_reading(&cmd->reading);
            app_state_t st; app_state_get(&st);
            persist_send(PERSIST_LOG, &st, "leitura_periodica");
            push_display();
            break;
        }
        case CTRL_CMD_SET_CONFIG: {
            app_state_set_config(&cmd->config);
            if (cmd->persist) {
                app_state_t st; app_state_get(&st);
                persist_send(PERSIST_SAVE_CONFIG, &st,
                             cmd->evento[0] ? cmd->evento : "config_salva");
            }
            push_display();
            break;
        }
        case CTRL_CMD_TOGGLE_SYSTEM: {
            app_config_t cfg; app_state_get_config(&cfg);
            cfg.system_on = !cfg.system_on;
            app_state_set_config(&cfg);
            if (cmd->persist) {
                app_state_t st; app_state_get(&st);
                persist_send(PERSIST_SAVE_CONFIG, &st,
                             cmd->evento[0] ? cmd->evento : "system_toggle");
            }
            break;
        }
        case CTRL_CMD_UI_MENU:
            s_in_menu = cmd->in_menu;
            break;
        case CTRL_CMD_CLEAR_LOGS: {
            app_state_t st; app_state_get(&st);
            persist_send(PERSIST_CLEAR_LOGS, &st, NULL);
            break;
        }
    }
}

/* ---------- API pública ---------- */

esp_err_t controller_init(QueueHandle_t persist_queue, QueueHandle_t display_queue)
{
    s_persist_q = persist_queue;
    s_display_q = display_queue;

    led_init();
    fan_init();

    s_cmd_q = xQueueCreate(CMD_QUEUE_LEN, sizeof(controller_cmd_t));
    return s_cmd_q ? ESP_OK : ESP_ERR_NO_MEM;
}

void controller_post(const controller_cmd_t *cmd)
{
    if (s_cmd_q) xQueueSend(s_cmd_q, cmd, 0);
}

void controller_task(void *arg)
{
    (void)arg;
    reevaluate();   /* estado inicial coerente */

    while (1) {
        controller_cmd_t cmd;
        if (xQueueReceive(s_cmd_q, &cmd, pdMS_TO_TICKS(IDLE_TIMEOUT_MS)) == pdTRUE)
            handle_cmd(&cmd);
        /* em timeout: apenas reavalia (idle → light/deep sleep) */
        reevaluate();
    }
}
