idf_component_register(
    SRCS "src/https_module.c"
    INCLUDE_DIRS "include"
    EMBED_TXTFILES "assets/index_https.html"
                   "certs/servercert.pem"
                   "certs/prvtkey.pem"
    REQUIRES nvs_flash esp_wifi esp_event esp_https_server esp_netif lwip
             log freertos sensor_module storage_module app_state controller_module
)
