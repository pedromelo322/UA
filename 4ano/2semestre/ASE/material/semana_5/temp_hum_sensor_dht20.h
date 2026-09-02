#ifndef __TEMP_HUM_SENSOR_DHT20_H__INCLUDED__
#define __TEMP_HUM_SENSOR_DHT20_H__INCLUDED__

#include "driver/i2c_master.h"

/* The DHT20 has a single, fixed 7-bit I2C address (datasheet pag. 10, sec. 7.3) */
#define DHT20_SENSOR_ADDR           0x38

/* Standard-mode max is 100 kHz; we stay conservative like the TC74 driver */
#define DHT20_SCL_DFLT_FREQ_HZ      100000

void dht20_init(i2c_master_bus_handle_t* pBusHandle,
                i2c_master_dev_handle_t* pSensorHandle,
                int sdaPin, int sclPin, uint32_t clkSpeedHz);

void dht20_free(i2c_master_bus_handle_t busHandle,
                i2c_master_dev_handle_t sensorHandle);

uint8_t dht20_read_status(i2c_master_dev_handle_t sensorHandle);

bool dht20_is_calibrated(i2c_master_dev_handle_t sensorHandle);

bool dht20_is_busy(i2c_master_dev_handle_t sensorHandle);

void dht20_trigger_measurement(i2c_master_dev_handle_t sensorHandle);

void dht20_read_raw(i2c_master_dev_handle_t sensorHandle, uint8_t* pBuffer);

bool dht20_measure(i2c_master_dev_handle_t sensorHandle, float* pTemperature, float* pHumidity);

#endif // __TEMP_HUM_SENSOR_DHT20_H__INCLUDED__
