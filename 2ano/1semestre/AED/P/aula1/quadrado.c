#include <stdio.h>
#include <math.h>


int main(int argc, char const *argv[])
{
    int n_linhas;
    printf("Numero de linhas da tabela: ");
    scanf("%d", &n_linhas);
    puts("Numero, Quadrado, Raiz Quadrada");
    for (size_t i = 0; i < n_linhas; i++)
    {
        printf("%d, %d, %.2lf\n", i, i*i, sqrt(i));

    }

    return 0;
}
