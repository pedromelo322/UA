#ifndef __TEMP_SENSOR_TC74_H__INCLUDED__
#define __TEMP_SENSOR_TC74_H__INCLUDED__

#include "driver/i2c_master.h"

#define TC74_A1_SENSOR_ADDR	        0x49
#define TC74_A5_SENSOR_ADDR         0x4D
#define TC74_SCL_DFLT_FREQ_HZ       50000

void tc74_init(i2c_master_bus_handle_t* pBusHandle,
               i2c_master_dev_handle_t* pSensorHandle,
               uint8_t sensorAddr, int sdaPin, int sclPin, uint32_t clkSpeedHz);

void tc74_free(i2c_master_bus_handle_t busHandle,
               i2c_master_dev_handle_t sensorHandle);

void tc74_standy(i2c_master_dev_handle_t sensorHandle);

void tc74_wakeup(i2c_master_dev_handle_t sensorHandle);

bool tc74_is_temperature_ready(i2c_master_dev_handle_t sensorHandle);

void tc74_wakeup_and_read_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp);

void tc74_read_temp_after_cfg(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp);

void tc74_read_temp_after_temp(i2c_master_dev_handle_t sensorHandle, uint8_t* pTemp);

#endif // __TEMP_SENSOR_TC74_H__INCLUDED__
