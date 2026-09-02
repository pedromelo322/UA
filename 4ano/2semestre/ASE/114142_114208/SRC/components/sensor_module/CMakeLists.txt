idf_component_register(
    SRCS "src/sensor_module.c"
    INCLUDE_DIRS "include"
    REQUIRES driver esp_timer log freertos app_state controller_module hw_config
)
