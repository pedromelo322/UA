/**
 * @file st7735.h
 * @brief Driver para display ST7735S (Adafruit Mini TFT 0.96" 160x80)
 * 
 * API pública para controlar o display TFT ST7735S via SPI.
 * Inclui funções para desenhar pixels, retângulos, texto e mais.
 * 
 * @example
 * ```c
 * st7735_config_t cfg = {
 *     .mosi_io_num = 19, .sclk_io_num = 21, .cs_io_num = 22,
 *     .dc_io_num = 2, .rst_io_num = 3, .bl_io_num = 15,
 *     .host_id = SPI2_HOST
 * };
 * st7735_init(&cfg);
 * st7735_fill_screen(ST7735_BLACK);
 * st7735_draw_string(10, 10, "Hello!", ST7735_WHITE, ST7735_BLACK, 2);
 * ```
 */

#pragma once

#include <stdint.h>
#include <stdbool.h>
#include "driver/spi_master.h"
#include "driver/gpio.h"
#include "esp_err.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ==================== Configuração do Display ==================== */

/** Largura do display em modo landscape (pixels) */
#define ST7735_WIDTH  160

/** Altura do display em modo landscape (pixels) */
#define ST7735_HEIGHT 80

/* ==================== Cores RGB565 ==================== */

#define ST7735_BLACK   0x0000  /**< Preto */
#define ST7735_WHITE   0xFFFF  /**< Branco */
#define ST7735_RED     0xF800  /**< Vermelho */
#define ST7735_GREEN   0x07E0  /**< Verde */
#define ST7735_BLUE    0x001F  /**< Azul */
#define ST7735_CYAN    0x07FF  /**< Ciano */
#define ST7735_MAGENTA 0xF81F  /**< Magenta */
#define ST7735_YELLOW  0xFFE0  /**< Amarelo */
#define ST7735_ORANGE  0xFC00  /**< Laranja */
#define ST7735_GRAY    0x7BEF  /**< Cinzento */

/** Macro para criar cor RGB565 a partir de componentes RGB (0-255) */
#define ST7735_RGB565(r, g, b) ((((r) & 0xF8) << 8) | (((g) & 0xFC) << 3) | ((b) >> 3))

/* ==================== Estruturas ==================== */

/**
 * @brief Configuração de hardware do display
 */
typedef struct {
    int mosi_io_num;           /**< Pino GPIO para MOSI (SI no display) */
    int sclk_io_num;           /**< Pino GPIO para Clock (SCK) */
    int cs_io_num;             /**< Pino GPIO para Chip Select (TCS) */
    int dc_io_num;             /**< Pino GPIO para Data/Command (DC) */
    int rst_io_num;            /**< Pino GPIO para Reset (RST) */
    int bl_io_num;             /**< Pino GPIO para Backlight (Lite), -1 se não usado */
    spi_host_device_t host_id; /**< Host SPI (SPI2_HOST ou SPI3_HOST) */
} st7735_config_t;

/* ==================== Funções Públicas ==================== */

/**
 * @brief Inicializa o display ST7735
 * @param cfg Ponteiro para estrutura de configuração
 * @return ESP_OK em caso de sucesso, código de erro caso contrário
 */
esp_err_t st7735_init(const st7735_config_t *cfg);

/**
 * @brief Desenha um pixel
 * @param x Coordenada X (0 a width-1)
 * @param y Coordenada Y (0 a height-1)
 * @param color Cor em formato RGB565
 */
void st7735_draw_pixel(uint16_t x, uint16_t y, uint16_t color);

/**
 * @brief Preenche um retângulo com uma cor
 * @param x Coordenada X do canto superior esquerdo
 * @param y Coordenada Y do canto superior esquerdo
 * @param w Largura do retângulo
 * @param h Altura do retângulo
 * @param color Cor em formato RGB565
 */
void st7735_fill_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);

/**
 * @brief Preenche todo o ecrã com uma cor
 * @param color Cor em formato RGB565
 */
void st7735_fill_screen(uint16_t color);

/**
 * @brief Define a rotação do display
 * @param rotation Valor de 0 a 3:
 *        - 0: Portrait (80x160)
 *        - 1: Landscape (160x80) [padrão]
 *        - 2: Portrait invertido (80x160)
 *        - 3: Landscape invertido (160x80)
 */
void st7735_set_rotation(uint8_t rotation);

/**
 * @brief Inverte as cores do display
 * @param invert true para inverter, false para normal
 */
void st7735_invert_display(bool invert);

/**
 * @brief Desenha um caractere
 * @param x Coordenada X
 * @param y Coordenada Y
 * @param c Caractere ASCII (32-127)
 * @param color Cor do texto
 * @param bg Cor de fundo
 * @param size Escala (1 = 5x7, 2 = 10x14, etc.)
 */
void st7735_draw_char(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg, uint8_t size);

/**
 * @brief Desenha uma string de texto
 * @param x Coordenada X inicial
 * @param y Coordenada Y inicial
 * @param str String terminada em NULL
 * @param color Cor do texto
 * @param bg Cor de fundo
 * @param size Escala do texto
 */
void st7735_draw_string(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size);

/**
 * @brief Obtém a largura atual do display
 * @return Largura em pixels (depende da rotação)
 */
uint16_t st7735_get_width(void);

/**
 * @brief Obtém a altura atual do display
 * @return Altura em pixels (depende da rotação)
 */
uint16_t st7735_get_height(void);

/**
 * @brief Desenha uma imagem RGB565 no display
 * @param x Coordenada X do canto superior esquerdo
 * @param y Coordenada Y do canto superior esquerdo
 * @param w Largura da imagem
 * @param h Altura da imagem
 * @param data Ponteiro para array de pixels RGB565 (big-endian)
 */
void st7735_draw_image(uint16_t x, uint16_t y, uint16_t w, uint16_t h, const uint16_t *data);

#ifdef __cplusplus
}
#endif
