#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    char *nome = malloc(100 * sizeof(char));

    printf("Nome: ");
    fgets(nome, 100, stdin);

    printf("Hello %s\n", nome);


    free(nome);

    return 0;
}
