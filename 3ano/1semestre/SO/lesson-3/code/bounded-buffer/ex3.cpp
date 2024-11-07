
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "process.h"
#include "fifo.h"


#define ACCESS 0


void incrementar(int *counter, int value, int sem){



    while(1){

        /* lock access to fifo */
        psem_down(sem, ACCESS);


        if (*counter > 0){
            *counter -= 1;
            printf("Processo: %d; Counter: %d\n",getpid(), *counter);
            fflush(stdout);
            usleep(100000);
        } else {
            /* release access to fifo */
            psem_up(sem, ACCESS);
            break;
        }

        /* release access to fifo */
        psem_up(sem, ACCESS);
    }



    printf("Saiu do loop PID: %d\n", getpid());
    return ;
}

int main(){


    int value = 0;

    do {
        printf("Insert a value between 10 and 20: ");
        scanf("%d", &value);
    } while(value < 10 || value > 20);

    int shid = shmget(IPC_PRIVATE, sizeof(int), IPC_CREAT | 0666);
    if (shid < 0) {
        printf("shmget error");
        return 1;
    }

    int *counter = (int *)shmat(shid, nullptr, 0);

    *counter = value;

    /* init semaphores */
    int sem = psemget(IPC_PRIVATE, 3, IPC_CREAT | 0600);
    psem_up(sem, ACCESS);





    

    fprintf(stderr, "Counter: %d\n", *counter);

    if (counter == (int *)-1) {
        printf("shmat error");
        return 1;
    }


    pid_t ppid[2];
    for (uint32_t i = 0; i < 2; i++)
    {
        if ((ppid[i] = pfork()) == 0)
        {
            incrementar(counter, value, sem);
            exit(EXIT_SUCCESS);
        }
        
    }

    /* wait for consumers fo finish */
    for (uint32_t i = 0; i < 2; i++)
    {
        pwaitpid(ppid[i], NULL, 0);
        printf("Processo %u finished\n", i+1);
    }

    return 0;
}