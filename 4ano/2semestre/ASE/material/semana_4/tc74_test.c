#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/i2c_master.h"

static const char *TAG = "TC74";

/* ---- I2C configuration ---- */
#define I2C_MASTER_SCL_IO           <TBD>
#define I2C_MASTER_SDA_IO           <TBD>
#define I2C_MASTER_NUM              I2C_NUM_0
#define I2C_MASTER_FREQ_HZ          <TBD>
#define I2C_MASTER_TX_BUF_DISABLE   0
#define I2C_MASTER_RX_BUF_DISABLE   0
#define I2C_MASTER_TIMEOUT_MS       1000

/* ---- TC74 specifics ---- */
#define TC74_ADDR                   <TBD>
#define TC74_REG_TEMP               <TBD>
#define TC74_REG_CONFIG             <TBD>

/* ---- I2C helper functions ---- */
static esp_err_t TC74RegisterRead(i2c_master_dev_handle_t devHandle, uint8_t regAddr, uint8_t* pData, size_t length)
{
    return i2c_master_transmit_receive(devHandle, &regAddr, 1, pData, length,
                                       I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
}

static esp_err_t TC74RegisterWriteByte(i2c_master_dev_handle_t devHandle, uint8_t regAddr, uint8_t data)
{
    uint8_t buffer[2] = {regAddr, data};
    return i2c_master_transmit(devHandle, buffer, sizeof(buffer),
                               I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
}

/* ---- I2C bus/device initialization ---- */
static void I2CMasterInit(i2c_master_bus_handle_t* pBusHandle, i2c_master_dev_handle_t* pDevHandle)
{
    i2c_master_bus_config_t busConfig =
    {
        .i2c_port = I2C_MASTER_NUM,
        .sda_io_num = I2C_MASTER_SDA_IO,
        .scl_io_num = I2C_MASTER_SCL_IO,
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .glitch_ignore_cnt = 7,
        .flags.enable_internal_pullup = true,
    };
    ESP_ERROR_CHECK(i2c_new_master_bus(&busConfig, pBusHandle));

    i2c_device_config_t devConfig =
    {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = TC74_ADDR,
        .scl_speed_hz = I2C_MASTER_FREQ_HZ,
    };
    ESP_ERROR_CHECK(i2c_master_bus_add_device(*pBusHandle, &devConfig, pDevHandle));
}

/* ---- Main application ---- */
void app_main(void)
{
    uint8_t tempReg;
    uint8_t cfgReg;
    i2c_master_bus_handle_t busHandle;
    i2c_master_dev_handle_t devHandle;

    I2CMasterInit(&busHandle, &devHandle);
    ESP_LOGI(TAG, "I2C initialized successfully");

    // Read configuration register
    ESP_ERROR_CHECK(TC74RegisterRead(devHandle, TC74_REG_CONFIG, &cfgReg, 1));
    ESP_LOGI(TAG, "Initial config = 0x%02X", cfgReg);

    // Ensure sensor is in normal mode (bit7 = 0)
    if (cfgReg & 0x80)
    {
        ESP_LOGW(TAG, "Sensor in standby, switching to normal mode...");
        cfgReg &= 0x7F;
        ESP_ERROR_CHECK(TC74RegisterWriteByte(devHandle, TC74_REG_CONFIG, cfgReg));
        vTaskDelay(pdMS_TO_TICKS(200));
    }

    while (1)
    {
        ESP_ERROR_CHECK(TC74RegisterRead(devHandle, TC74_REG_TEMP, &tempReg, 1));

        int8_t tempSigned = (int8_t)tempReg;  // Temperature in C
        ESP_LOGI(TAG, "Temperatura: %d C", tempSigned);

        vTaskDelay(pdMS_TO_TICKS(2000));
    }

    // Normally we never reach this, but here for completeness:
    ESP_ERROR_CHECK(i2c_master_bus_rm_device(devHandle));
    ESP_ERROR_CHECK(i2c_del_master_bus(busHandle));
    ESP_LOGI(TAG, "I2C de-initialized successfully");
}