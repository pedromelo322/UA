idf_component_register(
    SRCS "src/controller_module.c"
    INCLUDE_DIRS "include"
    REQUIRES driver esp_pm esp_wifi log freertos
             sensor_module app_state storage_module led_module fan_module hw_config
)
