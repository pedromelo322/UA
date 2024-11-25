#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <pthread.h>

#include "utils.h"
#include "thread.h"
#include "fifo.h"

#define NB 20

static Fifo *fifoFree = NULL; // being static, this pointer is accessible by all threads
static Fifo *fifoNotFree = NULL; // being static, this pointer is accessible by all threads
static char buffer[NB][256]; // Declare buffer as an array of strings

static pthread_cond_t available[NB];
static pthread_mutex_t block;

void serverLifeCycle(void){
    while(true){
        Item item = fifoRetrieve(fifoNotFree);

        uint32_t id1 = item.v1 / 1000000;
        uint32_t id2 = item.v2 / 1000000;

        bool raceCondition = (item.id == 0) or (item.v1 == 0) or (id1 != item.id) or (id2 != item.id) or (item.v1 != item.v2);
        if (raceCondition)
            printf("\e[31;01mA Server retrieved (%u,%u,%u) from the fifo\e[0m\n", item.id, item.v1, item.v2);

        printf("--Server abriu request %d\n", item.id);
        fflush(stdout);

        char response[256];
        sprintf(response, "response%d", item.id);

        strcpy(buffer[item.id-1], response); // Copy the response to the buffer

        //printf("--Server enviou response %d\n", item.id);
        //fflush(stdout);

        /* signal fifo is not available */
        cond_broadcast(&available[item.id]);

        usleep(500000);
    }
}

void clientLifeCycle(void){
    while(true){
        Item item = fifoRetrieve(fifoFree);

        uint32_t id1 = item.v1 / 1000000;
        uint32_t id2 = item.v2 / 1000000;

        bool raceCondition = (item.id == 0) or (item.v1 == 0) or (id1 != item.id) or (id2 != item.id) or (item.v1 != item.v2);
        if (raceCondition)
            printf("\e[31;01mA Client retrieved (%u,%u,%u) from the fifo\e[0m\n", item.id, item.v1, item.v2);

        char request[256];
        sprintf(request, "request%d", item.id);
        strcpy(buffer[item.id-1], request); // Copy the request to the buffer

        fifoInsert(fifoNotFree, item);

        printf("Cliente fez request %d\n", item.id);
        fflush(stdout);


        while(strcmp(buffer[item.id-1], request) == 0){
            cond_wait(&available[item.id], &block);
        }

        printf("--Cliente recebeu response %d\n", item.id);
        fflush(stdout);



        fifoInsert(fifoFree, item);

        
    }
}

void* clientThread(void *arg){
    clientLifeCycle();
    return NULL;
}

void* serverThread(void * arg){    
    serverLifeCycle();
    return NULL;
}

int main(void){
    /* init conditions variables */
    for (int i = 0; i < NB; i++){
        cond_init(&available[i], NULL);
    }

    /* init access mutex */
    mutex_init(&block, NULL);

    fifoFree = (Fifo*)mem_alloc(sizeof(Fifo));
    fifoInit(fifoFree);
    fifoNotFree = (Fifo*)mem_alloc(sizeof(Fifo));
    fifoInit(fifoNotFree);

    pthread_t sthr;
    pthread_t cthr[NB];

    for (int i = 0; i < NB; i++){
        uint32_t t = unsigned(i) + 1;
        uint32_t v = t * 1000000 ; // the value inserted includes the id 
        Item item = {t, v, v};
        fifoInsert(fifoFree, item);
        buffer[i][0] = '\0'; // Initialize buffer with empty strings
    }

    for (int i = 0; i < NB; i++){
        thread_create(&cthr[i], NULL, clientThread, NULL);
    }

    thread_create(&sthr, NULL, serverThread, NULL);

    thread_join(sthr, NULL);
    printf("Server Finished\n");

    for (int i = 0; i < NB; i++){
        thread_join(cthr[i], NULL);
        printf("client %d Finished\n", i);
    }

    return 0;
}