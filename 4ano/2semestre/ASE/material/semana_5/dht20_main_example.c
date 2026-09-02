#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "temp_hum_sensor_dht20.h"

static const char *TAG = "DHT20";

#define I2C_SDA_IO      <TBD>   // GPIO ligado ao SDA
#define I2C_SCL_IO      <TBD>   // GPIO ligado ao SCL

void app_main(void)
{
    i2c_master_bus_handle_t busHandle;
    i2c_master_dev_handle_t sensorHandle;

    dht20_init(&busHandle, &sensorHandle, I2C_SDA_IO, I2C_SCL_IO, DHT20_SCL_DFLT_FREQ_HZ);

    if (!dht20_is_calibrated(sensorHandle))
        ESP_LOGW(TAG, "Sensor reports NOT calibrated (status bits 0x18 not set)");

    while (1) {
        float temperature, humidity;

        if (dht20_measure(sensorHandle, &temperature, &humidity))
            ESP_LOGI(TAG, "Temperatura: %.2f C | Humidade: %.2f %%RH", temperature, humidity);
        else
            ESP_LOGE(TAG, "CRC error, leitura descartada");

        /* Datasheet recomenda medir a cada 2 s (pag. 6, sec. 4.4) */
        vTaskDelay(pdMS_TO_TICKS(2000));
    }

    dht20_free(busHandle, sensorHandle);
}
