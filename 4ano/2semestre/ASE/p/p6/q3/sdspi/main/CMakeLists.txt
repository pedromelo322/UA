set(srcs "sd_card_write.c")

idf_component_register(SRCS ${srcs}
                       INCLUDE_DIRS "."
                       REQUIRES fatfs sd_card esp_timer freertos driver
                       WHOLE_ARCHIVE)
