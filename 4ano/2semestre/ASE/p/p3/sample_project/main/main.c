#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_adc/adc_oneshot.h"
#define ADC_CHANNEL ADC_CHANNEL_2 // GPIO2 (check pin for ESP32-C6)
#define ADC_UNIT ADC_UNIT_1 // Use ADC1
#define ADC_ATTEN ADC_ATTEN_DB_12 // 12 dB, ~3.3 V full-scale
void app_main(void)
{
// ADC oneshot driver handle
adc_oneshot_unit_handle_t adc1Handle;
adc_oneshot_unit_init_cfg_t adc1InitCfg =
{
.unit_id = ADC_UNIT
};
adc_oneshot_new_unit(&adc1InitCfg, &adc1Handle);
// Configure channel
adc_oneshot_chan_cfg_t adcChanCfg=
{
.atten = ADC_ATTEN,
.bitwidth = ADC_BITWIDTH_DEFAULT // default = 12-bit
};
adc_oneshot_config_channel(adc1Handle, ADC_CHANNEL, &adcChanCfg);
while (1)
{
int adcRawVal;
float voltage;
adc_oneshot_read(adc1Handle, ADC_CHANNEL, &adcRawVal);
// Convert raw value to voltage (approximate, no calibration)
voltage = (adcRawVal / 4095.0f) * (1.1f/0.25f);
// Include here the code to print the digital value read
// and the corresponding analogue value
printf("ADC Raw Value: %d, Voltage: %.2f V\n", adcRawVal, voltage);
vTaskDelay(pdMS_TO_TICKS(1000));
}
}