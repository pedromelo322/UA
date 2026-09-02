#include <assert.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_event.h"
#include "esp_system.h"
#include "esp_sleep.h"

#include "app_state.h"
#include "sensor_module.h"
#include "controller_module.h"
#include "storage_module.h"
#include "https_module.h"
#include "interface_module.h"

void app_main(void)
{
    /* NVS + rede: obrigatório antes do Wi-Fi */
    esp_err_t nvs_ret = nvs_flash_init();
    if (nvs_ret == ESP_ERR_NVS_NO_FREE_PAGES || nvs_ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        nvs_ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(nvs_ret);
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    /* Estado partilhado (defaults) */
    ESP_ERROR_CHECK(app_state_init());

    /* Queues:
       - button/pot/display: input e LCD (apresentador interface)
       - persist: controller → storage_task (escrita no SD) */
    static QueueHandle_t button_queue;
    static QueueHandle_t pot_queue;
    static QueueHandle_t display_queue;
    static QueueHandle_t persist_queue;

    button_queue  = xQueueCreate(5, sizeof(uint32_t));
    pot_queue     = xQueueCreate(5, sizeof(int));
    display_queue = xQueueCreate(3, sizeof(sensor_data_t));
    persist_queue = xQueueCreate(8, sizeof(persist_msg_t));
    assert(button_queue && pot_queue && display_queue && persist_queue);

    /* Init hardware + módulos */
    sensor_init();
    if (storage_init() == ESP_OK) {
        app_config_t cfg;
        app_state_get_config(&cfg);          /* parte dos defaults */
        storage_load_config(&cfg);           /* sobrepõe com config.csv */
        app_state_set_config(&cfg);
    }
    controller_init(persist_queue, display_queue);   /* cria queue de comandos + atuadores */
    interface_init(button_queue, pot_queue);
    https_module_init();

    /* Cold boot: ligar Wi-Fi temporariamente para buscar a hora real (SNTP)
       antes de iniciar o logging — independente da config de Wi-Fi.
       Em wake de Deep Sleep a hora é mantida pelo RTC, por isso salta-se. */
    if (esp_sleep_get_wakeup_cause() == ESP_SLEEP_WAKEUP_UNDEFINED) {
        https_module_boot_sync();
    }

    /* Task args (static lifetime — tasks correm indefinidamente) */
    static interface_ui_args_t ui_args;
    ui_args = (interface_ui_args_t){
        .button_queue  = button_queue,
        .pot_queue     = pot_queue,
        .display_queue = display_queue,
    };

    /* Create tasks */
    xTaskCreate(controller_task,    "ctrl",   4096, NULL,          5, NULL);
    xTaskCreate(sensor_task,        "sensor", 4096, NULL,          5, NULL);
    xTaskCreate(storage_task,       "sd",     6144, persist_queue, 4, NULL);
    xTaskCreate(interface_ui_task,  "ui",     5120, &ui_args,      4, NULL);
    xTaskCreate(interface_pot_task, "pot",    2048, pot_queue,     3, NULL);
    xTaskCreate(https_task,         "https",  8192, NULL,          3, NULL);
}
