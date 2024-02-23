#include <stdio.h>
#include <math.h>
#include <string.h>

double degreesToRadians(double degrees) {
    return degrees * (M_PI / 180.0);
}

int main(int argc, char const *argv[])
{

    FILE *arquivo; // Declaração de um ponteiro de arquivo
    char texto[200];

    arquivo = fopen("graus.txt", "w");

    if (arquivo == NULL) {
        printf("Não foi possível abrir o arquivo.\n");
        return 1;
    }

    int primeiro = 0, ultimo = 0, intervalo = 0;
    printf("primeiro  ultimo intervalo: ");
    scanf("%d %d %d", &primeiro, &ultimo, &intervalo);
    sprintf(texto,"ang, sen(ang), cos(ang)\n");

    for (int i = primeiro; i <= ultimo; i += intervalo)
    {
        double angulo_em_radianos = degreesToRadians(i);
        sprintf(texto + strlen(texto),"%d, %f, %f\n", i, sin(angulo_em_radianos), cos(angulo_em_radianos));

    }


    fprintf(arquivo, "%s", texto);

    fclose(arquivo);

    printf("Texto escrito com sucesso.\n");

    return 0;
}
