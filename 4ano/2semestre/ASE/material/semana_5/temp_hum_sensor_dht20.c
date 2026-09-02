#include "temp_hum_sensor_dht20.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

/* ---- DHT20 commands (datasheet pag. 10, sec. 7.4) ---- */
#define DHT20_CMD_TRIGGER       0xAC    // trigger a temperature/humidity measurement
#define DHT20_CMD_TRIGGER_P1    0x33    // first parameter byte of the trigger command
#define DHT20_CMD_TRIGGER_P2    0x00    // second parameter byte of the trigger command

/* ---- Status byte bit masks (datasheet pag. 10, Table 9) ---- */
#define DHT20_STATUS_BUSY_MASK  0x80    // bit 7: 1 = busy/measuring, 0 = idle
#define DHT20_STATUS_CAL_MASK   0x18    // bits 3..4: must be set when sensor is calibrated

/* ---- Bus/device initialization (same scheme as the TC74 driver) ---- */
void dht20_init(i2c_master_bus_handle_t* pBusHandle,
                i2c_master_dev_handle_t* pSensorHandle,
                int sdaPin, int sclPin, uint32_t clkSpeedHz)
{
    i2c_master_bus_config_t i2cMasterCfg = {
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .i2c_port = I2C_NUM_0,
        .scl_io_num = sclPin,
        .sda_io_num = sdaPin,
        .glitch_ignore_cnt = 7,
        .flags.enable_internal_pullup = true,
    };

    ESP_ERROR_CHECK(i2c_new_master_bus(&i2cMasterCfg, pBusHandle));

    i2c_device_config_t i2cDevCfg = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = DHT20_SENSOR_ADDR,
        .scl_speed_hz = clkSpeedHz,
    };

    ESP_ERROR_CHECK(i2c_master_bus_add_device(*pBusHandle, &i2cDevCfg, pSensorHandle));

    /* After power-on the sensor needs >= 100 ms to reach idle (datasheet pag. 9, sec. 7.1) */
    vTaskDelay(pdMS_TO_TICKS(100));
}

void dht20_free(i2c_master_bus_handle_t busHandle, i2c_master_dev_handle_t sensorHandle)
{
    ESP_ERROR_CHECK(i2c_master_bus_rm_device(sensorHandle));
    ESP_ERROR_CHECK(i2c_del_master_bus(busHandle));
}

/* Read the 1-byte status word (datasheet pag. 10, sec. 7.4 step 1) */
uint8_t dht20_read_status(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t status;

    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, &status, sizeof(status), -1));
    return status;
}

/* Calibration bits (0x18) must be set; otherwise registers would need init (pag. 10 step 1) */
bool dht20_is_calibrated(i2c_master_dev_handle_t sensorHandle)
{
    return (dht20_read_status(sensorHandle) & DHT20_STATUS_CAL_MASK) == DHT20_STATUS_CAL_MASK;
}

/* Bit 7 of the status word tells whether a measurement is still running (pag. 10 step 3) */
bool dht20_is_busy(i2c_master_dev_handle_t sensorHandle)
{
    return (dht20_read_status(sensorHandle) & DHT20_STATUS_BUSY_MASK) != 0;
}

/* Send the measurement trigger command 0xAC 0x33 0x00 (datasheet pag. 10, sec. 7.4 step 2) */
void dht20_trigger_measurement(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[3] = {DHT20_CMD_TRIGGER, DHT20_CMD_TRIGGER_P1, DHT20_CMD_TRIGGER_P2};

    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer, sizeof(buffer), -1));
}

/* Read the 7 raw bytes: status + 5 data bytes + CRC (datasheet pag. 11, read frame) */
void dht20_read_raw(i2c_master_dev_handle_t sensorHandle, uint8_t* pBuffer)
{
    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, pBuffer, 7, -1));
}

/* CRC8, polynomial X^8+X^5+X^4+1 (0x31), init 0xFF (datasheet pag. 10, sec. 7.4 step 4) */
static uint8_t dht20_crc8(const uint8_t* pData, size_t length)
{
    uint8_t crc = 0xFF;

    for (size_t i = 0; i < length; i++) {
        crc ^= pData[i];
        for (uint8_t bit = 0; bit < 8; bit++) {
            if (crc & 0x80)
                crc = (crc << 1) ^ 0x31;
            else
                crc <<= 1;
        }
    }
    return crc;
}

/*
 * Full measurement cycle. Returns true on success (and fills the pointers),
 * or false if the CRC does not match. Temperature in C, humidity in %RH.
 */dht20_trigger_measurement
bool dht20_measure(i2c_master_dev_handle_t sensorHandle, float* pTemperature, float* pHumidity)
{
    uint8_t buffer[7];

    dht20_trigger_measurement(sensorHandle);

    /* Wait >= 80 ms for the conversion, then poll the busy bit (datasheet pag. 10, step 3) */
    vTaskDelay(pdMS_TO_TICKS(80));
    while (dht20_is_busy(sensorHandle))
        vTaskDelay(pdMS_TO_TICKS(1));

    dht20_read_raw(sensorHandle, buffer);

    /* Verify integrity: CRC (last byte) is computed over the first 6 bytes */
    if (dht20_crc8(buffer, 6) != buffer[6])
        return false;

    /*
     * Bytes (after the status byte 0):
     *   buffer[1] = humidity[19:12]
     *   buffer[2] = humidity[11:4]
     *   buffer[3] = humidity[3:0] (high nibble) | temperature[19:16] (low nibble)
     *   buffer[4] = temperature[15:8]
     *   buffer[5] = temperature[7:0]
     */
    uint32_t rawHumidity = ((uint32_t)buffer[1] << 12) |
                           ((uint32_t)buffer[2] << 4) |
                           ((uint32_t)buffer[3] >> 4);

    uint32_t rawTemperature = (((uint32_t)buffer[3] & 0x0F) << 16) |
                              ((uint32_t)buffer[4] << 8) |
                              ((uint32_t)buffer[5]);

    /* Conversion formulas from datasheet pag. 11, sec. 8 (2^20 = 1048576) */
    *pHumidity = ((float)rawHumidity / 1048576.0f) * 100.0f;
    *pTemperature = ((float)rawTemperature / 1048576.0f) * 200.0f - 50.0f;

    return true;
}
