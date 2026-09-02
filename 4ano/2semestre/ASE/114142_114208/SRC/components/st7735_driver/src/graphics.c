#include "graphics.h"
#include "st7735.h"
#include <stdlib.h>
#include <string.h>

// Fonte 5x7 básica (caracteres ASCII 32-127)
extern const uint8_t font5x7[];

void draw_pixel(uint16_t x, uint16_t y, uint16_t color) {
    st7735_draw_pixel(x, y, color);
}

void draw_hline(uint16_t x, uint16_t y, uint16_t w, uint16_t color) {
    st7735_fill_rect(x, y, w, 1, color);
}

void draw_vline(uint16_t x, uint16_t y, uint16_t h, uint16_t color) {
    st7735_fill_rect(x, y, 1, h, color);
}

void draw_line(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color) {
    int16_t steep = abs((int16_t)y1 - (int16_t)y0) > abs((int16_t)x1 - (int16_t)x0);
    int16_t dx, dy, err, ystep;

    if (steep) {
        // Swap x0, y0
        uint16_t tmp = x0; x0 = y0; y0 = tmp;
        // Swap x1, y1
        tmp = x1; x1 = y1; y1 = tmp;
    }

    if (x0 > x1) {
        // Swap x0, x1
        uint16_t tmp = x0; x0 = x1; x1 = tmp;
        // Swap y0, y1
        tmp = y0; y0 = y1; y1 = tmp;
    }

    dx = x1 - x0;
    dy = abs((int16_t)y1 - (int16_t)y0);

    err = dx / 2;
    ystep = (y0 < y1) ? 1 : -1;

    for (; x0 <= x1; x0++) {
        if (steep) {
            draw_pixel(y0, x0, color);
        } else {
            draw_pixel(x0, y0, color);
        }
        err -= dy;
        if (err < 0) {
            y0 += ystep;
            err += dx;
        }
    }
}

void draw_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    draw_hline(x, y, w, color);          // Top
    draw_hline(x, y + h - 1, w, color);  // Bottom
    draw_vline(x, y, h, color);          // Left
    draw_vline(x + w - 1, y, h, color);  // Right
}

void draw_filled_rect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    st7735_fill_rect(x, y, w, h, color);
}

void draw_circle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color) {
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    draw_pixel(x0, y0 + r, color);
    draw_pixel(x0, y0 - r, color);
    draw_pixel(x0 + r, y0, color);
    draw_pixel(x0 - r, y0, color);

    while (x < y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;

        draw_pixel(x0 + x, y0 + y, color);
        draw_pixel(x0 - x, y0 + y, color);
        draw_pixel(x0 + x, y0 - y, color);
        draw_pixel(x0 - x, y0 - y, color);
        draw_pixel(x0 + y, y0 + x, color);
        draw_pixel(x0 - y, y0 + x, color);
        draw_pixel(x0 + y, y0 - x, color);
        draw_pixel(x0 - y, y0 - x, color);
    }
}

void draw_filled_circle(uint16_t x0, uint16_t y0, uint16_t r, uint16_t color) {
    draw_vline(x0, y0 - r, 2 * r + 1, color);
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    while (x < y) {
        if (f >= 0) {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;

        draw_vline(x0 + x, y0 - y, 2 * y + 1, color);
        draw_vline(x0 - x, y0 - y, 2 * y + 1, color);
        draw_vline(x0 + y, y0 - x, 2 * x + 1, color);
        draw_vline(x0 - y, y0 - x, 2 * x + 1, color);
    }
}

void draw_char(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg, uint8_t size) {
    if (c < 32 || c > 127) c = '?'; // Substitui caracteres fora do range
    
    uint8_t index = c - 32;
    
    for (uint8_t i = 0; i < 5; i++) {
        uint8_t line = font5x7[index * 5 + i];
        for (uint8_t j = 0; j < 7; j++) {
            if (line & (1 << j)) {
                if (size == 1) {
                    draw_pixel(x + i, y + j, color);
                } else {
                    st7735_fill_rect(x + i * size, y + j * size, size, size, color);
                }
            } else if (bg != color) {
                if (size == 1) {
                    draw_pixel(x + i, y + j, bg);
                } else {
                    st7735_fill_rect(x + i * size, y + j * size, size, size, bg);
                }
            }
        }
    }
    
    // Espaço entre caracteres
    if (bg != color) {
        if (size == 1) {
            draw_vline(x + 5, y, 7, bg);
        } else {
            st7735_fill_rect(x + 5 * size, y, size, 7 * size, bg);
        }
    }
}

void draw_string(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size) {
    uint16_t cursor_x = x;
    
    while (*str) {
        if (*str == '\n') {
            y += 8 * size;
            cursor_x = x;
        } else {
            draw_char(cursor_x, y, *str, color, bg, size);
            cursor_x += 6 * size; // 5 pixels + 1 espaço
        }
        str++;
    }
}

void draw_image_rgb565(uint16_t x, uint16_t y, uint16_t width, uint16_t height, const uint16_t *image_data) {
    if (image_data == NULL) {
        return;
    }
    
    // Usa a função otimizada do driver ST7735
    st7735_draw_image(x, y, width, height, image_data);
}
