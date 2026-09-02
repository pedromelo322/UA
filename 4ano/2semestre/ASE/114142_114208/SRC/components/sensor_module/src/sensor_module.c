#include "sensor_module.h"
#include "controller_module.h"
#include "app_state.h"
#include "hw_config.h"
#include "driver/i2c_master.h"
#include "esp_log.h"
#include "esp_timer.h"
#include "freertos/task.h"

static const char *TAG = "SENSOR";

#define I2C_MASTER_FREQ_HZ      100000
#define I2C_MASTER_TIMEOUT_MS   1000

#define DHT20_ADDR              0x38
#define DHT20_CMD_STATUS        0x71
#define DHT20_CMD_TRIGGER       0xAC
#define DHT20_TRIGGER_PARAM0    0x33
#define DHT20_TRIGGER_PARAM1    0x00
#define DHT20_STATUS_CALIBRATED 0x18
#define DHT20_STATUS_BUSY_BIT   0x80

static i2c_master_bus_handle_t s_bus_handle;
static i2c_master_dev_handle_t s_dev_handle;

/* Envia bytes para o DHT20 via I2C. */
static esp_err_t dht20_write(uint8_t *data, size_t len)
{
    return i2c_master_transmit(s_dev_handle, data, len,
                               I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
}

/* Inicializa o barramento I2C, regista o DHT20 e confirma que esta calibrado. */
esp_err_t sensor_init(void)
{
    i2c_master_bus_config_t bus_cfg = {
        .i2c_port          = HW_I2C_PORT,
        .sda_io_num        = HW_I2C_SDA_GPIO,
        .scl_io_num        = HW_I2C_SCL_GPIO,
        .clk_source        = I2C_CLK_SRC_DEFAULT,
        .glitch_ignore_cnt = 7,
        .flags.enable_internal_pullup = true,
    };
    ESP_ERROR_CHECK(i2c_new_master_bus(&bus_cfg, &s_bus_handle));

    i2c_device_config_t dev_cfg = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address  = DHT20_ADDR,
        .scl_speed_hz    = I2C_MASTER_FREQ_HZ,
    };
    ESP_ERROR_CHECK(i2c_master_bus_add_device(s_bus_handle, &dev_cfg, &s_dev_handle));

    vTaskDelay(pdMS_TO_TICKS(100));
    uint8_t cmd = DHT20_CMD_STATUS;
    ESP_ERROR_CHECK(dht20_write(&cmd, 1));

    uint8_t status = 0;
    ESP_ERROR_CHECK(i2c_master_receive(s_dev_handle, &status, 1,
                    I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS));
    ESP_LOGI(TAG, "Status = 0x%02X", status);
    if ((status & 0x18) != DHT20_STATUS_CALIBRATED)
        ESP_LOGW(TAG, "Sensor not calibrated!");
    else
        ESP_LOGI(TAG, "Sensor ready.");

    return ESP_OK;
}

/* Dispara uma medicao, espera o sensor ficar pronto e converte os bytes
   brutos (20 bits cada) em humidade (%) e temperatura (graus C). */
static esp_err_t sensor_read_raw(float *humidity, float *temperature)
{
    uint8_t trigger[3] = {DHT20_CMD_TRIGGER, DHT20_TRIGGER_PARAM0, DHT20_TRIGGER_PARAM1};
    esp_err_t ret = dht20_write(trigger, sizeof(trigger));
    if (ret != ESP_OK) return ret;

    vTaskDelay(pdMS_TO_TICKS(80));

    uint8_t buf[6] = {0};
    for (int i = 0; i < 10; i++) {
        ret = i2c_master_receive(s_dev_handle, buf, sizeof(buf),
                                 I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
        if (ret != ESP_OK) return ret;
        if (!(buf[0] & DHT20_STATUS_BUSY_BIT)) break;
        vTaskDelay(pdMS_TO_TICKS(10));
    }
    if (buf[0] & DHT20_STATUS_BUSY_BIT) {
        ESP_LOGE(TAG, "Sensor timeout");
        return ESP_ERR_TIMEOUT;
    }

    uint32_t raw_hum  = ((uint32_t)buf[1] << 12) |
                        ((uint32_t)buf[2] <<  4) |
                        ((uint32_t)buf[3] >>  4);
    uint32_t raw_temp = (((uint32_t)buf[3] & 0x0F) << 16) |
                         ((uint32_t)buf[4] <<  8) |
                          (uint32_t)buf[5];

    *humidity    = ((float)raw_hum  / (1 << 20)) * 100.0f;
    *temperature = ((float)raw_temp / (1 << 20)) * 200.0f - 50.0f;

    return ESP_OK;
}

/* Le o sensor a cada read_interval segundos e publica a leitura no controller. */
void sensor_task(void *arg)
{
    (void)arg;

    while (1) {
        sensor_data_t data = { .timestamp_ms = esp_timer_get_time() / 1000 };

        if (sensor_read_raw(&data.humidity, &data.temperature) == ESP_OK) {
            controller_cmd_t cmd = { .type = CTRL_CMD_READING, .reading = data };
            controller_post(&cmd);
        } else {
            ESP_LOGE(TAG, "Read error");
        }

        app_config_t cfg;
        app_state_get_config(&cfg);
        int interval_s = cfg.read_interval > 0 ? cfg.read_interval : 20;
        vTaskDelay(pdMS_TO_TICKS(interval_s * 1000));
    }
}
