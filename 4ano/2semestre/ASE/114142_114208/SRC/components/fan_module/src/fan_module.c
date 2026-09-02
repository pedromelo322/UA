#include "fan_module.h"
#include "hw_config.h"
#include "driver/ledc.h"
#include "driver/gpio.h"
#include "esp_log.h"


#define FAN_FREQ_HZ      25000
#define FAN_RESOLUTION   LEDC_TIMER_8_BIT
#define FAN_TIMER        LEDC_TIMER_0
#define FAN_SPEED_MODE   LEDC_LOW_SPEED_MODE
#define FAN_COLD_CHANNEL LEDC_CHANNEL_0
#define FAN_HOT_CHANNEL  LEDC_CHANNEL_1

static const char *TAG = "fan_module";

/* Configura o timer LEDC e os dois canais PWM (frio + quente) */
esp_err_t fan_init(void)
{
    /* Liberta hold que possa ter ficado de um deep sleep anterior */
    gpio_hold_dis(HW_FAN_COLD_GPIO);
    gpio_hold_dis(HW_FAN_HOT_GPIO);

    ledc_timer_config_t timer = {
        .speed_mode      = FAN_SPEED_MODE,
        .timer_num       = FAN_TIMER,
        .duty_resolution = FAN_RESOLUTION,
        .freq_hz         = FAN_FREQ_HZ,
        .clk_cfg         = LEDC_AUTO_CLK,
    };
    ESP_ERROR_CHECK(ledc_timer_config(&timer));

    ledc_channel_config_t cold_ch = {
        .gpio_num   = HW_FAN_COLD_GPIO,
        .speed_mode = FAN_SPEED_MODE,
        .channel    = FAN_COLD_CHANNEL,
        .timer_sel  = FAN_TIMER,
        .duty       = 0,
        .hpoint     = 0,
    };
    ESP_ERROR_CHECK(ledc_channel_config(&cold_ch));

    ledc_channel_config_t hot_ch = {
        .gpio_num   = HW_FAN_HOT_GPIO,
        .speed_mode = FAN_SPEED_MODE,
        .channel    = FAN_HOT_CHANNEL,
        .timer_sel  = FAN_TIMER,
        .duty       = 0,
        .hpoint     = 0,
    };
    ESP_ERROR_CHECK(ledc_channel_config(&hot_ch));

    ESP_LOGI(TAG, "init: cold=GPIO%d, hot=GPIO%d, %uHz 8-bit",
             HW_FAN_COLD_GPIO, HW_FAN_HOT_GPIO, FAN_FREQ_HZ);
    return ESP_OK;
}

/* Define a velocidade da ventoinha de frio em percentagem (0-100). */
void fan_set_cold(uint8_t percent)
{
    uint32_t duty = (uint32_t)percent * 255 / 100;
    ledc_set_duty(FAN_SPEED_MODE, FAN_COLD_CHANNEL, duty);
    ledc_update_duty(FAN_SPEED_MODE, FAN_COLD_CHANNEL);
}

/* Define a velocidade da ventoinha de quente em percentagem (0-100). */
void fan_set_hot(uint8_t percent)
{
    uint32_t duty = (uint32_t)percent * 255 / 100;
    ledc_set_duty(FAN_SPEED_MODE, FAN_HOT_CHANNEL, duty);
    ledc_update_duty(FAN_SPEED_MODE, FAN_HOT_CHANNEL);
}

/* Desliga as ventoinhas e tranca os GPIOs a 0 (hold), p/ ficarem desligadas
   durante light/deep sleep, quando o LEDC deixa de atuar. */
void fan_hold_off(void)
{
    fan_set_cold(0);
    fan_set_hot(0);
    gpio_hold_en(HW_FAN_COLD_GPIO);
    gpio_hold_en(HW_FAN_HOT_GPIO);
}

/* Liberta o hold dos GPIOs para o PWM voltar a controlar as ventoinhas. */
void fan_release_hold(void)
{
    gpio_hold_dis(HW_FAN_COLD_GPIO);
    gpio_hold_dis(HW_FAN_HOT_GPIO);
}
