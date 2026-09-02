#include "temp_sensor_tc74.h"

#define TC74_COMMAND_RTR    0x00
#define TC74_COMMAND_RWCR   0x01

#define TC74_STANDBY_MASK   0x80
#define TC74_READY_MASK     0x40

void tc74_init(i2c_master_bus_handle_t* pBusHandle,
               i2c_master_dev_handle_t* pSensorHandle,
               uint8_t sensorAddr, int sdaPin, int sclPin, uint32_t clkSpeedHz)
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
        .device_address = sensorAddr,
        .scl_speed_hz = clkSpeedHz,
    };

    ESP_ERROR_CHECK(i2c_master_bus_add_device(*pBusHandle, &i2cDevCfg, pSensorHandle));
}

void tc74_free(i2c_master_bus_handle_t busHandle, i2c_master_dev_handle_t sensorHandle)
{
    ESP_ERROR_CHECK(i2c_master_bus_rm_device(sensorHandle));
    ESP_ERROR_CHECK(i2c_del_master_bus(busHandle));
}

void tc74_standy(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[2] = {TC74_COMMAND_RWCR, TC74_STANDBY_MASK};
    
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer, sizeof(buffer), -1));
}

void tc74_wakeup(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t buffer[2] = {TC74_COMMAND_RWCR, 0x00};
    
    ESP_ERROR_CHECK(i2c_master_transmit(sensorHandle, buffer, sizeof(buffer), -1));
}

bool tc74_is_temperature_ready(i2c_master_dev_handle_t sensorHandle)
{
    uint8_t command = TC74_COMMAND_RWCR;
    uint8_t cnfgReg;
    
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle, &command, sizeof(command),
                                                &cnfgReg, sizeof(cnfgReg), -1));
    return (cnfgReg & TC74_READY_MASK);
}

void tc74_wakeup_and_read_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    tc74_wakeup(sensorHandle);
    while (!tc74_is_temperature_ready(sensorHandle));
    tc74_read_temp_after_cfg(sensorHandle, pTemp);
}

void tc74_read_temp_after_cfg(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    uint8_t command = TC74_COMMAND_RTR;
    
    ESP_ERROR_CHECK(i2c_master_transmit_receive(sensorHandle, &command, sizeof(command),
                                                pTemp, sizeof(*pTemp), -1));
}

void tc74_read_temp_after_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp)
{
    ESP_ERROR_CHECK(i2c_master_receive(sensorHandle, pTemp, sizeof(*pTemp), -1));
}
