#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"


// As funções devem ter a assinatura: void Nome(void *pvParameters)
void Task1(void *pvParameters) {
    while (1) {
        printf("reading temperature \n");
        vTaskDelay(1000 / portTICK_PERIOD_MS); // Bloqueia a tarefa por 1s
    }
}

void Task2(void *pvParameters) {
    while (1) {
        printf("reading humidity \n");
        vTaskDelay(2000 / portTICK_PERIOD_MS); // Bloqueia a tarefa por 2s
    }
}

void app_main(void) {
    // Criação das tarefas no scheduler 
    xTaskCreate(Task1, "TempTask", 2048, NULL, 5, NULL);
    xTaskCreate(Task2, "HumTask", 2048, NULL, 5, NULL);
}