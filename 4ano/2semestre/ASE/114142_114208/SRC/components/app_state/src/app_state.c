#include "app_state.h"
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"

static SemaphoreHandle_t s_mtx = NULL;   
static app_state_t       s_state;        


#define LOCK()   xSemaphoreTake(s_mtx, portMAX_DELAY)
#define UNLOCK() xSemaphoreGive(s_mtx)

// Cria o mutex e carrega os valores por defeito. 
esp_err_t app_state_init(void)
{
    s_mtx = xSemaphoreCreateMutex();
    if (!s_mtx) return ESP_ERR_NO_MEM;

    /* Defaults de fabrica; sao depois sobrepostos pelo config.csv do SD, se existir. */
    s_state = (app_state_t){
        .config = {
            .t_max         = 30.0f,
            .t_min         = 25.0f,
            .deep_sleep    = false,
            .wifi          = false,
            .system_on     = true,
            .read_interval = 20,
        },
        .thermal      = THERMAL_APAGADO,
        .power_mode   = POWER_ACTIVE,
        .last_reading = {0},
    };
    return ESP_OK;
}

/* Copia um snapshot completo e consistente do estado para *out. */
void app_state_get(app_state_t *out)
{
    LOCK();
    *out = s_state;
    UNLOCK();
}

/* Copia apenas a config (limites, flags, intervalo) para *out. */
void app_state_get_config(app_config_t *out)
{
    LOCK();
    *out = s_state.config;
    UNLOCK();
}

/* Substitui a config inteira (UI/HTTP/load do SD aplicam aqui). */
void app_state_set_config(const app_config_t *cfg)
{
    LOCK();
    s_state.config = *cfg;
    UNLOCK();
}

/* Guarda a ultima leitura do sensor (temperatura/humidade/timestamp). */
void app_state_set_reading(const sensor_data_t *r)
{
    LOCK();
    s_state.last_reading = *r;
    UNLOCK();
}

/* Atualiza o estado termico atual (conforto/aquecendo/arrefecendo/apagado). */
void app_state_set_thermal(thermal_state_t s)
{
    LOCK();
    s_state.thermal = s;
    UNLOCK();
}

/* Atualiza o modo de energia atual (active/modem/light/deep sleep). */
void app_state_set_power(power_mode_t m)
{
    LOCK();
    s_state.power_mode = m;
    UNLOCK();
}
