#include <stdio.h>
#include <stdbool.h>
#include "Guiao_07_Ficheiros_para_os_Estudantes/01_STACK_and_QUEUE_example/IntegersQueue.c"
#include "Guiao_07_Ficheiros_para_os_Estudantes/01_STACK_and_QUEUE_example/IntegersStack.c"


bool isCapicua(int number) {
    Stack *stack;
    Queue *queue;
    
    stack = StackCreate(20);
    queue = QueueCreate(20);

    // Processa os dígitos do número
    while (number > 0) {
        int digit = number % 10;
        StackPush(stack, digit);
        QueueEnqueue(queue, digit);
        number /= 10;
    }
    

    // Compara os dígitos da pilha e da fila
    while (stack->cur_size > 0 && !QueueIsEmpty(queue)) {
        if (StackPop(stack) != QueueDequeue(queue)) {
            return false;  // Não é capicua
        }
    }

    return true; // É capicua

}

int main() {
    int number;

    printf("Digite um número inteiro positivo: ");
    scanf("%d", &number);

    if (isCapicua(number)) {
        printf("%d é uma capicua.\n", number);
    } else {
        printf("%d não é uma capicua.\n", number);
    }

    return 0;
}
