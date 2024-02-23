#include <stdio.h>
#include "elapsed_time.h"

/*Um número de Armstrong, para uma dada base, é um número inteiro positivo de n algarismos
que é igual à soma de cada um dos seus algarismos levantado à n-ésima potência.*/


void elevateNum(int* n, int exp){

    int num = 1;

    for (int i =0; i < exp; i++)
    {
        num *= (*n);
    }

    *n = num;
    
}

void elevateArray(int * array, int size){


    for (int i = 0; i < size; i++)
    {
        elevateNum(array+i,size);
    }
    

}



void buscarDigitos(size_t num, int* array, int *size){


    if (num >= 0){

        *size += 1;

        if (num < 10){
            *array = num;
        }else{
            *array = num%10;
            buscarDigitos(num/10, array+1, size);

        }
    }

}


void dysplayArray(int * array, int size){

    for (int i = 0; i < size; i++)
    {
        printf("%d, ", array[i]);
    }
    printf("\n");
    

}



int main(int argc, char const *argv[])
{
    double start_time = cpu_time();

    int size;

    int Max = 1000000;

    int * digitos = (int *) malloc(7 * sizeof(int));

    int num;
    
    for (int i = 0; i < Max; i++)
    {
        size = 0;

        buscarDigitos(i, digitos, &size);

        elevateArray(digitos, size);


        num = 0;

        for (size_t i = 0; i < size; i++)
        {
            num += digitos[i];
        }



        if (i == num){
            printf("%d é um Armstrong\n", i);
        }
        

    }


    

    double finish_time = cpu_time();

    double exec_time = finish_time - start_time;

    printf(" tempo: %9.3e", exec_time);

    free(digitos);

    return 0;
}
