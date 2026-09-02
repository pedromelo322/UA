#pragma once
#include <stdbool.h>
#include <stddef.h>
#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"
#include "sensor_module.h"
#include "app_state.h"

/* Pedidos de persistência enviados pelo controller à storage_task. */
typedef enum {
    PERSIST_LOG,           /* anexa uma linha a logs.csv */
    PERSIST_SAVE_CONFIG,   /* grava config.csv (+ anexa log do evento) */
    PERSIST_CLEAR_LOGS,    /* apaga logs.csv */
} persist_type_t;

typedef struct {
    persist_type_t type;
    sensor_data_t  reading;     /* leitura usada na linha de log */
    app_config_t   config;      /* limites p/ calcular estado + gravar config */
    char           evento[32];  /* etiqueta do evento no log */
} persist_msg_t;

esp_err_t storage_init(void);

/* Lê config.csv para *io (que deve já conter os defaults); campos ausentes
   ficam com o valor de entrada. */
esp_err_t storage_load_config(app_config_t *io);
esp_err_t storage_save_config(const app_config_t *cfg);
esp_err_t storage_clear_logs(void);

void storage_read_last_logs(char *buf, size_t buf_size, int n_lines);

/* Task de persistência. arg = QueueHandle_t (persist_queue de persist_msg_t). */
void storage_task(void *arg);
