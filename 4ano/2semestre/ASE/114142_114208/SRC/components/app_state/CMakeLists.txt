idf_component_register(
    SRCS "src/app_state.c"
    INCLUDE_DIRS "include"
    REQUIRES freertos sensor_module
)
