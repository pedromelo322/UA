#include <stdio.h>
#include <stdlib.h>
#include "elapsed_time.h"


//factorião é um número inteiro positivo n que é igual à soma do factorial de cada um dos seus algarismos.

int factorial(int n, int * array){

    if (n == 0){

        array[n] = 1;


    }else{

        array[n] = n * factorial(n-1, array);

    }

    return array[n];

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





int main(int argc, char const *argv[])
{

    double start_time = cpu_time();


    int * array = (int *) malloc(10 * sizeof(int));

    factorial(10, array);

    int size;

    int * digitos = (int *) malloc(7 * sizeof(int));

    size_t t;
    


    for (size_t i = 0; i < 1000000; i++)
    {

        size = 0;
        
        buscarDigitos(i, digitos, &size);

        t = 0;

        for (int *e = digitos; e < (digitos + size); e++)
        {

            t += array[*e];

        }


        if (t == i){

            printf("Factorião: %d\n", i);

        }

        
    }
    double finish_time = cpu_time();

    double exec_time = finish_time - start_time;

    printf("%9.3e", exec_time);

    free(digitos);
    
    
    return 0;
}
