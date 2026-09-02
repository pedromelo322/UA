/**
 * @file st7735.c
 * @brief Driver para display ST7735S (Adafruit Mini TFT 0.96" 160x80)
 */

#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "esp_heap_caps.h"
#include "st7735.h"
#include "st7735_commands.h"

static const char *TAG = "ST7735";

#define SPI_CLOCK_SPEED_HZ  (8 * 1000 * 1000)
#define MAX_TRANSFER_SIZE   (160 * 80 * 2 + 8)

static spi_device_handle_t spi = NULL;
static int dc_pin = -1;
static int rst_pin = -1;
static uint8_t colstart = 1;
static uint8_t rowstart = 26;
static uint16_t display_width = ST7735_WIDTH;
static uint16_t display_height = ST7735_HEIGHT;

static const uint8_t font5x7[96 * 5] = {
    0x00,0x00,0x00,0x00,0x00, 0x00,0x00,0x5F,0x00,0x00,
    0x00,0x07,0x00,0x07,0x00, 0x14,0x7F,0x14,0x7F,0x14,
    0x24,0x2A,0x7F,0x2A,0x12, 0x23,0x13,0x08,0x64,0x62,
    0x36,0x49,0x55,0x22,0x50, 0x00,0x05,0x03,0x00,0x00,
    0x00,0x1C,0x22,0x41,0x00, 0x00,0x41,0x22,0x1C,0x00,
    0x08,0x2A,0x1C,0x2A,0x08, 0x08,0x08,0x3E,0x08,0x08,
    0x00,0x50,0x30,0x00,0x00, 0x08,0x08,0x08,0x08,0x08,
    0x00,0x60,0x60,0x00,0x00, 0x20,0x10,0x08,0x04,0x02,
    0x3E,0x51,0x49,0x45,0x3E, 0x00,0x42,0x7F,0x40,0x00,
    0x42,0x61,0x51,0x49,0x46, 0x21,0x41,0x45,0x4B,0x31,
    0x18,0x14,0x12,0x7F,0x10, 0x27,0x45,0x45,0x45,0x39,
    0x3C,0x4A,0x49,0x49,0x30, 0x01,0x71,0x09,0x05,0x03,
    0x36,0x49,0x49,0x49,0x36, 0x06,0x49,0x49,0x29,0x1E,
    0x00,0x36,0x36,0x00,0x00, 0x00,0x56,0x36,0x00,0x00,
    0x00,0x08,0x14,0x22,0x41, 0x14,0x14,0x14,0x14,0x14,
    0x41,0x22,0x14,0x08,0x00, 0x02,0x01,0x51,0x09,0x06,
    0x32,0x49,0x79,0x41,0x3E, 0x7E,0x11,0x11,0x11,0x7E,
    0x7F,0x49,0x49,0x49,0x36, 0x3E,0x41,0x41,0x41,0x22,
    0x7F,0x41,0x41,0x22,0x1C, 0x7F,0x49,0x49,0x49,0x41,
    0x7F,0x09,0x09,0x01,0x01, 0x3E,0x41,0x41,0x51,0x32,
    0x7F,0x08,0x08,0x08,0x7F, 0x00,0x41,0x7F,0x41,0x00,
    0x20,0x40,0x41,0x3F,0x01, 0x7F,0x08,0x14,0x22,0x41,
    0x7F,0x40,0x40,0x40,0x40, 0x7F,0x02,0x04,0x02,0x7F,
    0x7F,0x04,0x08,0x10,0x7F, 0x3E,0x41,0x41,0x41,0x3E,
    0x7F,0x09,0x09,0x09,0x06, 0x3E,0x41,0x51,0x21,0x5E,
    0x7F,0x09,0x19,0x29,0x46, 0x46,0x49,0x49,0x49,0x31,
    0x01,0x01,0x7F,0x01,0x01, 0x3F,0x40,0x40,0x40,0x3F,
    0x1F,0x20,0x40,0x20,0x1F, 0x7F,0x20,0x18,0x20,0x7F,
    0x63,0x14,0x08,0x14,0x63, 0x03,0x04,0x78,0x04,0x03,
    0x61,0x51,0x49,0x45,0x43, 0x00,0x00,0x7F,0x41,0x41,
    0x02,0x04,0x08,0x10,0x20, 0x41,0x41,0x7F,0x00,0x00,
    0x04,0x02,0x01,0x02,0x04, 0x40,0x40,0x40,0x40,0x40,
    0x00,0x01,0x02,0x04,0x00, 0x20,0x54,0x54,0x54,0x78,
    0x7F,0x48,0x44,0x44,0x38, 0x38,0x44,0x44,0x44,0x20,
    0x38,0x44,0x44,0x48,0x7F, 0x38,0x54,0x54,0x54,0x18,
    0x08,0x7E,0x09,0x01,0x02, 0x08,0x14,0x54,0x54,0x3C,
    0x7F,0x08,0x04,0x04,0x78, 0x00,0x44,0x7D,0x40,0x00,
    0x20,0x40,0x44,0x3D,0x00, 0x00,0x7F,0x10,0x28,0x44,
    0x00,0x41,0x7F,0x40,0x00, 0x7C,0x04,0x18,0x04,0x78,
    0x7C,0x08,0x04,0x04,0x78, 0x38,0x44,0x44,0x44,0x38,
    0x7C,0x14,0x14,0x14,0x08, 0x08,0x14,0x14,0x18,0x7C,
    0x7C,0x08,0x04,0x04,0x08, 0x48,0x54,0x54,0x54,0x20,
    0x04,0x3F,0x44,0x40,0x20, 0x3C,0x40,0x40,0x20,0x7C,
    0x1C,0x20,0x40,0x20,0x1C, 0x3C,0x40,0x30,0x40,0x3C,
    0x44,0x28,0x10,0x28,0x44, 0x0C,0x50,0x50,0x50,0x3C,
    0x44,0x64,0x54,0x4C,0x44, 0x00,0x08,0x36,0x41,0x00,
    0x00,0x00,0x7F,0x00,0x00, 0x00,0x41,0x36,0x08,0x00,
    0x08,0x08,0x2A,0x1C,0x08, 0x00,0x00,0x00,0x00,0x00
};

static void write_command(uint8_t cmd) {
    spi_transaction_t t = { .length = 8, .tx_buffer = &cmd };
    gpio_set_level(dc_pin, 0);
    spi_device_polling_transmit(spi, &t);
}

static void write_data(const uint8_t *data, size_t len) {
    if (len == 0) return;
    spi_transaction_t t = { .length = len * 8, .tx_buffer = data };
    gpio_set_level(dc_pin, 1);
    spi_device_polling_transmit(spi, &t);
}

static inline void write_data_byte(uint8_t byte) {
    write_data(&byte, 1);
}

static void set_address_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1) {
    uint8_t data[4];
    write_command(ST7735_CASET);
    data[0] = (x0 + colstart) >> 8; data[1] = (x0 + colstart) & 0xFF;
    data[2] = (x1 + colstart) >> 8; data[3] = (x1 + colstart) & 0xFF;
    write_data(data, 4);
    write_command(ST7735_RASET);
    data[0] = (y0 + rowstart) >> 8; data[1] = (y0 + rowstart) & 0xFF;
    data[2] = (y1 + rowstart) >> 8; data[3] = (y1 + rowstart) & 0xFF;
    write_data(data, 4);
    write_command(ST7735_RAMWR);
}

esp_err_t st7735_init(const st7735_config_t *cfg) {
    esp_err_t ret;
    dc_pin = cfg->dc_io_num;
    rst_pin = cfg->rst_io_num;
    
    ESP_LOGI(TAG, "ST7735 Driver - Adafruit Mini TFT 0.96");
    ESP_LOGI(TAG, "Pinos: MOSI=%d CLK=%d CS=%d DC=%d RST=%d BL=%d",
             cfg->mosi_io_num, cfg->sclk_io_num, cfg->cs_io_num,
             cfg->dc_io_num, cfg->rst_io_num, cfg->bl_io_num);
    
    gpio_config_t io_conf = {
        .pin_bit_mask = (1ULL << dc_pin) | (1ULL << rst_pin),
        .mode = GPIO_MODE_OUTPUT,
    };
    gpio_config(&io_conf);
    
    if (cfg->bl_io_num >= 0) {
        gpio_config_t bl_conf = { .pin_bit_mask = (1ULL << cfg->bl_io_num), .mode = GPIO_MODE_OUTPUT };
        gpio_config(&bl_conf);
        gpio_set_level(cfg->bl_io_num, 1);
        ESP_LOGI(TAG, "Backlight ON");
    }
    
    spi_bus_config_t buscfg = {
        .mosi_io_num = cfg->mosi_io_num, .miso_io_num = -1, .sclk_io_num = cfg->sclk_io_num,
        .quadwp_io_num = -1, .quadhd_io_num = -1, .max_transfer_sz = MAX_TRANSFER_SIZE,
    };
    spi_device_interface_config_t devcfg = {
        .clock_speed_hz = SPI_CLOCK_SPEED_HZ, .mode = 0, .spics_io_num = cfg->cs_io_num,
        .queue_size = 7, .flags = SPI_DEVICE_NO_DUMMY,
    };
    
    ret = spi_bus_initialize(cfg->host_id, &buscfg, SPI_DMA_CH_AUTO);
    if (ret != ESP_OK && ret != ESP_ERR_INVALID_STATE) {
        ESP_LOGE(TAG, "SPI bus falhou: %s", esp_err_to_name(ret));
        return ret;
    }
    ret = spi_bus_add_device(cfg->host_id, &devcfg, &spi);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "SPI device falhou: %s", esp_err_to_name(ret));
        return ret;
    }
    ESP_LOGI(TAG, "SPI @ %d MHz", SPI_CLOCK_SPEED_HZ / 1000000);
    
    gpio_set_level(rst_pin, 1); vTaskDelay(pdMS_TO_TICKS(50));
    gpio_set_level(rst_pin, 0); vTaskDelay(pdMS_TO_TICKS(100));
    gpio_set_level(rst_pin, 1); vTaskDelay(pdMS_TO_TICKS(200));
    
    write_command(ST7735_SWRESET); vTaskDelay(pdMS_TO_TICKS(150));
    write_command(ST7735_SLPOUT); vTaskDelay(pdMS_TO_TICKS(500));
    
    write_command(ST7735_FRMCTR1);
    write_data_byte(0x01); write_data_byte(0x2C); write_data_byte(0x2D);
    write_command(ST7735_FRMCTR2);
    write_data_byte(0x01); write_data_byte(0x2C); write_data_byte(0x2D);
    write_command(ST7735_FRMCTR3);
    write_data_byte(0x01); write_data_byte(0x2C); write_data_byte(0x2D);
    write_data_byte(0x01); write_data_byte(0x2C); write_data_byte(0x2D);
    
    write_command(ST7735_INVCTR); write_data_byte(0x07);
    write_command(ST7735_PWCTR1); write_data_byte(0xA2); write_data_byte(0x02); write_data_byte(0x84);
    write_command(ST7735_PWCTR2); write_data_byte(0xC5);
    write_command(ST7735_PWCTR3); write_data_byte(0x0A); write_data_byte(0x00);
    write_command(ST7735_PWCTR4); write_data_byte(0x8A); write_data_byte(0x2A);
    write_command(ST7735_PWCTR5); write_data_byte(0x8A); write_data_byte(0xEE);
    write_command(ST7735_VMCTR1); write_data_byte(0x0E);
    write_command(ST7735_INVON);
    
    write_command(ST7735_MADCTL); write_data_byte(0x78);
    colstart = 1; rowstart = 26; display_width = 160; display_height = 80;
    
    write_command(ST7735_COLMOD); write_data_byte(0x05);
    
    write_command(ST7735_GMCTRP1);
    { uint8_t d[] = {0x02,0x1C,0x07,0x12,0x37,0x32,0x29,0x2D,0x29,0x25,0x2B,0x39,0x00,0x01,0x03,0x10}; write_data(d,16); }
    write_command(ST7735_GMCTRN1);
    { uint8_t d[] = {0x03,0x1D,0x07,0x06,0x2E,0x2C,0x29,0x2D,0x2E,0x2E,0x37,0x3F,0x00,0x00,0x02,0x10}; write_data(d,16); }
    
    write_command(ST7735_NORON); vTaskDelay(pdMS_TO_TICKS(10));
    write_command(ST7735_DISPON); vTaskDelay(pdMS_TO_TICKS(100));
    
    ESP_LOGI(TAG, "Display OK: %dx%d pixels", display_width, display_height);
    return ESP_OK;
}

void st7735_fill_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    if (x >= display_width || y >= display_height) return;
    if (x + w > display_width) w = display_width - x;
    if (y + h > display_height) h = display_height - y;
    
    set_address_window(x, y, x + w - 1, y + h - 1);
    size_t line_size = w * 2;
    uint8_t *buffer = heap_caps_malloc(line_size, MALLOC_CAP_DMA);
    if (!buffer) { ESP_LOGE(TAG, "DMA malloc falhou"); return; }
    
    uint8_t hi = color >> 8, lo = color & 0xFF;
    for (size_t i = 0; i < w; i++) { buffer[i*2] = hi; buffer[i*2+1] = lo; }
    for (uint16_t i = 0; i < h; i++) write_data(buffer, line_size);
    heap_caps_free(buffer);
}

void st7735_draw_pixel(uint16_t x, uint16_t y, uint16_t color) {
    if (x >= display_width || y >= display_height) return;
    set_address_window(x, y, x, y);
    uint8_t data[2] = { color >> 8, color & 0xFF };
    write_data(data, 2);
}

void st7735_fill_screen(uint16_t color) {
    st7735_fill_rect(0, 0, display_width, display_height, color);
}

void st7735_set_rotation(uint8_t rotation) {
    uint8_t madctl;
    switch (rotation % 4) {
        case 0: madctl=0x08; colstart=26; rowstart=1; display_width=80; display_height=160; break;
        case 1: madctl=0x78; colstart=1; rowstart=26; display_width=160; display_height=80; break;
        case 2: madctl=0xC8; colstart=26; rowstart=1; display_width=80; display_height=160; break;
        case 3: madctl=0xB8; colstart=1; rowstart=26; display_width=160; display_height=80; break;
        default: return;
    }
    write_command(ST7735_MADCTL);
    write_data_byte(madctl);
}

void st7735_invert_display(bool invert) {
    write_command(invert ? ST7735_INVON : ST7735_INVOFF);
}

void st7735_draw_char(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg, uint8_t size) {
    if (c < 32 || c > 127) c = '?';
    uint8_t idx = c - 32;
    for (uint8_t col = 0; col < 5; col++) {
        uint8_t line = font5x7[idx * 5 + col];
        for (uint8_t row = 0; row < 7; row++) {
            uint16_t px = (line & (1 << row)) ? color : bg;
            if (size == 1) st7735_draw_pixel(x + col, y + row, px);
            else st7735_fill_rect(x + col*size, y + row*size, size, size, px);
        }
    }
}

void st7735_draw_string(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size) {
    uint16_t cx = x;
    while (*str) {
        if (*str == '\n') { y += 8 * size; cx = x; }
        else { st7735_draw_char(cx, y, *str, color, bg, size); cx += 6 * size; }
        str++;
    }
}



uint16_t st7735_get_width(void) { return display_width; }
uint16_t st7735_get_height(void) { return display_height; }

void st7735_draw_image(uint16_t x, uint16_t y, uint16_t w, uint16_t h, const uint16_t *data) {
    if (x >= display_width || y >= display_height) return;
    if (x + w > display_width) w = display_width - x;
    if (y + h > display_height) h = display_height - y;
    
    set_address_window(x, y, x + w - 1, y + h - 1);
    
    // Buffer para uma linha da imagem
    size_t line_size = w * 2;
    uint8_t *buffer = heap_caps_malloc(line_size, MALLOC_CAP_DMA);
    if (!buffer) { 
        ESP_LOGE(TAG, "DMA malloc falhou para imagem"); 
        return; 
    }
    
    // Enviar linha por linha
    for (uint16_t row = 0; row < h; row++) {
        for (uint16_t col = 0; col < w; col++) {
            uint16_t pixel = data[row * w + col];
            buffer[col * 2] = pixel >> 8;      // High byte
            buffer[col * 2 + 1] = pixel & 0xFF; // Low byte
        }
        write_data(buffer, line_size);
    }
    
    heap_caps_free(buffer);
}
