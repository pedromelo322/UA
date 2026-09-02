idf_component_register(
    SRCS "src/interface_module.c"
    INCLUDE_DIRS "include"
    REQUIRES driver esp_adc esp_timer log freertos
             sensor_module app_state controller_module st7735_driver hw_config
)
