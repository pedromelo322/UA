idf_component_register(
    SRCS "src/led_module.c"
    INCLUDE_DIRS "include"
    REQUIRES driver esp_timer hw_config
)
