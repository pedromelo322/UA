#pragma once
#include "esp_err.h"

/* Modos do LED de estado (ver máquina de estados do LED no CLAUDE.md):
   APAGADO (sistema off), PISCAR LENTO (conforto), LIGADO FIXO (a atuar). */
typedef enum {
    LED_OFF,
    LED_ON,
    LED_BLINK,
} led_mode_t;

esp_err_t led_init(void);
void      led_set_mode(led_mode_t mode);
