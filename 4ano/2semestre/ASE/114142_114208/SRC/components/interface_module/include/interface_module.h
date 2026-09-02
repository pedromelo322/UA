#pragma once
#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "sensor_module.h"
#include "app_state.h"
#include "controller_module.h"

typedef enum { UI_DISPLAY, UI_MENU, UI_EDITAR } ui_state_t;
typedef enum {
    MENU_T_MAX = 0, MENU_T_MIN, MENU_DEEP_SLEEP, MENU_WIFI, MENU_SYSTEM_ON, MENU_LEITURA_S, MENU_SAIR, MENU_COUNT,
} menu_item_t;

typedef struct {
    QueueHandle_t button_queue;
    QueueHandle_t pot_queue;
    QueueHandle_t display_queue;
} interface_ui_args_t;

esp_err_t interface_init(QueueHandle_t button_queue, QueueHandle_t pot_queue);
void      interface_pot_task(void *arg);   /* arg = QueueHandle_t (pot_queue) */
void      interface_ui_task(void *arg);    /* arg = interface_ui_args_t* */
