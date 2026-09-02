#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#define BLINK_GPIO GPIO_NUM_15 // GPIO15 on ESP32-C6

void app_main(void)
{
    gpio_config_t ioCfg = { // configure GPIO15 as output
        .pin_bit_mask = 1ULL << BLINK_GPIO, // bit mask for GPIO15
        .mode = GPIO_MODE_OUTPUT,
        .pull_up_en = GPIO_PULLUP_DISABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = GPIO_INTR_DISABLE};

gpio_config(&ioCfg);

bool level = false;

while (1){
    gpio_set_level(BLINK_GPIO, level);
    level = !level; // invert for next toggle
    vTaskDelay(pdMS_TO_TICKS(1000)); // delay 1 second
}
}