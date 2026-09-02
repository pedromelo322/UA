idf_component_register(SRCS "main.c"
                    INCLUDE_DIRS "."
                    REQUIRES app_state sensor_module controller_module storage_module
                             https_module interface_module
                             nvs_flash esp_netif esp_event freertos)
