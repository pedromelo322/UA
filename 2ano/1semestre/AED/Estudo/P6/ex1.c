#include <stdio.h>
#include <stdlib.h>
#include "elapsed_time.h"


size_t arrayGlobal[1001][1001] = {0};


size_t F1(size_t m, size_t n){

    size_t valor;


    if (arrayGlobal[m][n] != 0){
        valor = arrayGlobal[m][n];
    }else{
        if (m == 0 || n == 0){
            valor =  1;
        }else{

            valor = F1(m-1,n) + F1(m-1, n-1) + F1(m, n - 1);
            
        }

        arrayGlobal[m][n] = valor;
    }


    return valor;

}

size_t F2(size_t m, size_t n){

    size_t array[m+1][n+1];


    for (size_t i = 0; i <= m; i++)
    {
        for (size_t j = 0; j <= n; j++)
        {

            if (i == 0 || j == 0){
                array[i][j] = 1;
            }else{
                array[i][j] = array[i-1][j] + array[i-1][j-1] + array[i][j-1];
            }

            printf("%d\t", array[i][j]);

        }

        printf("\n");
        
    }

    return array[m][n]; 
    

}

void printArrayGlobal(size_t m,size_t n){


    for (size_t i = 0; i <= m; i++)
    {
        for (size_t j = 0; j <= n; j++){
            printf("%d\t",arrayGlobal[i][j]);
        }
        printf("\n");
    }
    

}


size_t main(size_t argc, char const *argv[])
{


    double start_time;
    double finish_time;
    double exec_time;

    size_t m = 8;
    size_t n = 8;

    
    start_time = cpu_time();

    F1(m,n);

    printArrayGlobal(m,n);

    finish_time = cpu_time();

    exec_time = finish_time - start_time;

    printf(" tempo: %9.3e\n", exec_time);

    start_time = cpu_time();

    F2(m,n);
    
    finish_time = cpu_time();

    exec_time = finish_time - start_time;

    printf(" tempo: %9.3e\n", exec_time);

    return 0;
}