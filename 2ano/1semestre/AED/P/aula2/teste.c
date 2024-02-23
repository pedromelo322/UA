#include <stdio.h>

void incrementa(int *ponteiro) {
    ponteiro++; // incrementa o valor apontado por ponteiro
}

int main() {
    int x = 10; // declara uma variável inteira x e atribui o valor 10

    printf("O valor de x é %d\n", x); // imprime o valor de x

    incrementa(&x); // passa o endereço de memória de x para a função incrementa

    printf("O novo valor de x é %d\n", x); // imprime o novo valor de x

    return 0;
}