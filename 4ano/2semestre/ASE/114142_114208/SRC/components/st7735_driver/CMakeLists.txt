idf_component_register(
    SRCS "src/st7735.c" 
         "src/graphics.c"
    INCLUDE_DIRS "include"
    REQUIRES driver esp_timer log esp_hw_support
)