#pragma once
#include <stdint.h>
#include "esp_err.h"

typedef struct {
    float   temperature;
    float   humidity;
    int64_t timestamp_ms;
} sensor_data_t;

esp_err_t sensor_init(void);
void      sensor_task(void *arg);   /* arg = NULL — publica via controller_post() */
