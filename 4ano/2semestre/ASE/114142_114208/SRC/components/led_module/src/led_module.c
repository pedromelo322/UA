#include "led_module.h"
#include "hw_config.h"
#include "driver/gpio.h"
#include "esp_timer.h"

#define LED_BLINK_PERIOD_US  500000   /* pisca lento: 500 ms */

static led_mode_t       s_mode  = LED_OFF;
static bool             s_level = false;
static esp_timer_handle_t s_blink_timer = NULL;

/* Callback do timer: só ativo enquanto o modo for LED_BLINK. */
static void blink_cb(void *arg)
{
    (void)arg;
    if (s_mode != LED_BLINK) return;
    s_level = !s_level;
    gpio_set_level(HW_LED_GPIO, s_level);
}

/* Configura o GPIO do LED e arranca o timer periodico usado pelo modo BLINK. */
esp_err_t led_init(void)
{
    gpio_config_t cfg = {
        .pin_bit_mask  = 1ULL << HW_LED_GPIO,
        .mode          = GPIO_MODE_OUTPUT,
        .pull_up_en    = GPIO_PULLUP_DISABLE,
        .pull_down_en  = GPIO_PULLDOWN_DISABLE,
        .intr_type     = GPIO_INTR_DISABLE,
    };
    gpio_config(&cfg);
    gpio_set_level(HW_LED_GPIO, 0);

    const esp_timer_create_args_t targs = {
        .callback = blink_cb,
        .name     = "led_blink",
    };
    esp_err_t ret = esp_timer_create(&targs, &s_blink_timer);
    if (ret == ESP_OK)
        esp_timer_start_periodic(s_blink_timer, LED_BLINK_PERIOD_US);
    return ret;
}

/* Muda o modo do LED: OFF/ON acendem de imediato; BLINK deixa o toggle ao timer. */
void led_set_mode(led_mode_t mode)
{
    s_mode = mode;
    switch (mode) {
        case LED_OFF:
            s_level = false;
            gpio_set_level(HW_LED_GPIO, 0);
            break;
        case LED_ON:
            s_level = true;
            gpio_set_level(HW_LED_GPIO, 1);
            break;
        case LED_BLINK:
            /* o toggle acontece no blink_cb periódico */
            break;
    }
}
