idf_component_register(
    SRCS "src/storage_module.c"
    INCLUDE_DIRS "include"
    REQUIRES driver fatfs sdmmc esp_driver_sdspi log freertos sensor_module app_state hw_config
)
