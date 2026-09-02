#pragma once

#include <stdint.h>
#include "st7735.h"

// Protótipos de funções gráficas
void draw_pixel(uint16_t x, uint16_t y, uint16_t color);
void draw_hline(uint16_t x, uint16_t y, uint16_t w, uint16_t color);
void draw_vline(uint16_t x, uint16_t y, uint16_t h, uint16_t color);
void draw_line(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);
void draw_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void draw_filled_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void draw_circle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color);
void draw_filled_circle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color);

// Funções de texto
void draw_char(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg, uint8_t size);
void draw_string(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size);
void draw_image_rgb565(uint16_t x, uint16_t y, uint16_t width, uint16_t height, const uint16_t *image_data);