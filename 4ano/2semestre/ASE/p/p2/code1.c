#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

void Task1(){
    while (true){
        printf("reading temperature \n");
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

void Task2(){
    while (true){
        printf("reading humidity \n");
        vTaskDelay(2000 / portTICK_PERIOD_MS);
    }
}

void app_main(void){
Task1();
Task2();
}