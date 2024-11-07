#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "utils.h"
#include "thread.h"
#include "fifo.h"



int increment(int* counter){

    int valor;
    do{
        printf("Número entre 10 e 20\n");
        scanf("%d", &valor);
    }while(valor < 10 || valor > 20);

    while(*counter < valor){
        (*counter)++;
        printf("Counter: %d\n", *counter);
        fflush(stdout);
        usleep(100000);
    }

    return EXIT_SUCCESS;

}


void *childthread(void *arg)
{
    int *p = (int*)arg; // we know arg is a pointer to a uint32_t
    increment(p);
    thread_exit(NULL);
    return NULL;
}



int main(void){


    int valor;

    do{
        printf("Número entre 1 e 9\n");
        scanf("%d", &valor);
    }while(valor < 1 || valor > 9);

    int counter = valor;

    pthread_t thread;

    thread_create(&thread, NULL, childthread, &counter);

    thread_join(thread, NULL);
    
    while(counter > 0){
        counter--;
        printf("Counter: %d\n", counter);
        fflush(stdout);
        usleep(100000);
    }

    return 0;

}