#pragma once
#include <stdbool.h>
#include "esp_err.h"
#include "sensor_module.h"

/* Estado térmico do sistema (camada de controlo). */
typedef enum {
    THERMAL_APAGADO,
    THERMAL_CONFORTO,
    THERMAL_AQUECENDO,
    THERMAL_ARREFECENDO,
} thermal_state_t;

/* Modo de energia atual (decidido pelo controller). */
typedef enum {
    POWER_ACTIVE,
    POWER_MODEM_SLEEP,
    POWER_LIGHT_SLEEP,
    POWER_DEEP_SLEEP,
} power_mode_t;

/* Parâmetros configuráveis e persistidos no SD (config.csv). */
typedef struct {
    float t_max;
    float t_min;
    bool  deep_sleep;
    bool  wifi;
    bool  system_on;
    int   read_interval;   /* segundos entre leituras do sensor */
} app_config_t;

/* Snapshot completo do estado do sistema. */
typedef struct {
    app_config_t    config;
    thermal_state_t thermal;
    power_mode_t    power_mode;
    sensor_data_t   last_reading;
} app_state_t;

/* Cria o mutex e aplica os valores por defeito. Chamar uma vez no arranque. */
esp_err_t app_state_init(void);

/* Leitura (qualquer task): copia consistente sob mutex. */
void app_state_get(app_state_t *out);
void app_state_get_config(app_config_t *out);

/* Escrita: na prática só o controller deve escrever (single-writer). */
void app_state_set_config(const app_config_t *cfg);
void app_state_set_reading(const sensor_data_t *r);
void app_state_set_thermal(thermal_state_t s);
void app_state_set_power(power_mode_t m);
