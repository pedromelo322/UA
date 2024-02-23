#include<stdio.h>
#include<math.h>

int main(int argc, char const *argv[])
{

    int ang_max, ang, espc;

    printf("Angulo: ");
    scanf("%d", &ang);


    printf("Angulo max: ");
    scanf("%d", &ang_max);

    printf("Espaçamento: ");
    scanf("%d", &espc);




    puts("\nang sin(ang)       cos(ang)");
    puts("--- -------------- --------------\n");

    while (ang <= ang_max){

        double rad = ang * 3.14159 / 180;

        printf("%3d %14f %14f\n",ang, sin(rad), cos(rad));

        ang += espc;
    }


  


    return 0;
}
