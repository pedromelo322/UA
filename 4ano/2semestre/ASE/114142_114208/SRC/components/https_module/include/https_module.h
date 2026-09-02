#pragma once
#include <stdbool.h>
#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/queue.h"

esp_err_t https_module_init(void);
void      https_task(void *arg);

/* Cold boot: liga Wi-Fi temporariamente, sincroniza a hora via SNTP e
   depois respeita a config de Wi-Fi (desliga se estiver OFF). */
void      https_module_boot_sync(void);

bool https_get_system_on(void);
void https_set_system_on(bool v);
