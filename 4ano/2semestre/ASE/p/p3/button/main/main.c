#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#define INPUT_GPIO GPIO_NUM_23 // choose an available board GPIO

void app_main(void)
{

    // Configure the GPIO as input with pull-up enabled
    gpio_config_t ioCfg = {
        .pin_bit_mask = 1ULL << INPUT_GPIO, // selected GPIO bit mask
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE, // enable internal pull-up
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = GPIO_INTR_DISABLE
    };

    gpio_config(&ioCfg);

    while (1){
        int level = gpio_get_level(INPUT_GPIO); // read the pin state

        // Include here the code to print the button state
        if (level == 0) {
            printf("Button Pressed\n");
        } else {
            printf("Button Released\n");
        }
        vTaskDelay(pdMS_TO_TICKS(1000)); // check every 1s
    }
}
