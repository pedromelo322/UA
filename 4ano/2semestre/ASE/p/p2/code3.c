#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"


static TaskHandle_t Task1Handle = NULL;

void Sender(void *pvParameters) {
    while (1) {
        xTaskNotifyGive(Task1Handle); // Envia uma notificação para a Task1
        vTaskDelay(1000 / portTICK_PERIOD_MS); // Bloqueia a tarefa por 1s
    }
}


void Receiver(void *pvParameters) {
    while (1) {
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY); // Aguarda a notificação da Sender
        printf("Notification received: reading temperature \n");
    }
}

void app_main(void) {
    // Criação da tarefa Receiver e armazena o handle
    xTaskCreate(Receiver, "ReceiverTask", 2048, NULL, 5, &Task1Handle);
    // Criação da tarefa Sender
    xTaskCreate(Sender, "SenderTask", 2048, NULL, 5, NULL);
}