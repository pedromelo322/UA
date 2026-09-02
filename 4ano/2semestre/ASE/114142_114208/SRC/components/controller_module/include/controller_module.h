#pragma once
#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "sensor_module.h"
#include "app_state.h"

/* Comandos aceites pelo controller (única entrada do cérebro). */
typedef enum {
    CTRL_CMD_READING,        /* nova leitura do sensor          → .reading        */
    CTRL_CMD_SET_CONFIG,     /* aplicar config (UI/HTTP)        → .config/.persist */
    CTRL_CMD_TOGGLE_SYSTEM,  /* ligar/desligar sistema          → .persist         */
    CTRL_CMD_UI_MENU,        /* utilizador entrou/saiu do menu  → .in_menu         */
    CTRL_CMD_CLEAR_LOGS,     /* apagar logs.csv                                    */
} controller_cmd_type_t;

typedef struct {
    controller_cmd_type_t type;
    sensor_data_t reading;     /* CTRL_CMD_READING */
    app_config_t  config;      /* CTRL_CMD_SET_CONFIG */
    bool          persist;     /* SET_CONFIG / TOGGLE_SYSTEM: gravar + logar */
    bool          in_menu;     /* CTRL_CMD_UI_MENU */
    char          evento[32];  /* etiqueta para o log */
} controller_cmd_t;

/* Inicializa atuadores (LED + ventoinhas) e cria a queue de comandos.
   persist_queue: para a storage_task; display_queue: snapshots p/ o LCD. */
esp_err_t controller_init(QueueHandle_t persist_queue, QueueHandle_t display_queue);

/* Envia um comando ao controller (não bloqueante). Usado por sensor/UI/HTTP. */
void controller_post(const controller_cmd_t *cmd);

void controller_task(void *arg);   /* arg = NULL */
