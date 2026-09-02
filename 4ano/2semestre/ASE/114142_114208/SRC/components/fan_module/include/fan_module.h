#pragma once
#include "esp_err.h"
#include <stdint.h>

esp_err_t fan_init(void);
void fan_set_cold(uint8_t percent);  /* 0–100 */
void fan_set_hot(uint8_t percent);   /* 0–100 */
void fan_hold_off(void);             /* força 0% e bloqueia GPIO low (antes de sleep) */
void fan_release_hold(void);         /* liberta hold (após acordar de sleep) */
