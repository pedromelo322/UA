#pragma once

/* LED de estado */
#define HW_LED_GPIO         8

/* Botão (menu + wakeup) */
#define HW_BUTTON_GPIO      0//10

/* I2C — DHT20 */
#define HW_I2C_SCL_GPIO     7
#define HW_I2C_SDA_GPIO     6
#define HW_I2C_PORT         0   /* I2C_NUM_0 */

/* PWM — ventoinhas */
#define HW_FAN_COLD_GPIO    5
#define HW_FAN_HOT_GPIO     4

/* SPI partilhado — TFT ST7735 + SD card */
#define HW_SPI_MOSI_GPIO    19
#define HW_SPI_SCLK_GPIO    21
#define HW_SPI_MISO_GPIO    20  /* apenas SD */

/* TFT ST7735 */
#define HW_TFT_CS_GPIO      22
#define HW_TFT_DC_GPIO       2
#define HW_TFT_RST_GPIO      3
#define HW_TFT_BL_GPIO      15

/* SD card */
#define HW_SD_CS_GPIO       18

/* Potenciómetro */
#define HW_POT_ADC_CHANNEL  1   /* ADC_CHANNEL_1 */
