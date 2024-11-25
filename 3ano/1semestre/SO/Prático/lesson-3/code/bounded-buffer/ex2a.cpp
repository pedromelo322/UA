
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

int main(){

    // Create shared memory segment
    int shmid = shmget(IPC_PRIVATE, sizeof(int), IPC_CREAT | 0666);
    if (shmid < 0) {
        printf("shmget error");
        return 1;
    }

    // Attach shared memory segment
    int *counter = (int *)shmat(shmid, nullptr, 0);
    if (counter == (int *)-1) {
        printf("shmat error");
        return 1;
    }

    // Initialize counter
    *counter = 1;



    pid_t ret = fork();
    

    if (ret == 0){
        int value = 0;
        do {
            printf("Insert a value between 10 and 20: ");
            scanf("%d", &value);
        } while(value < 10 || value > 20);


        while(*counter < value){
            printf("\r%d", (*counter)/10);
            printf("%d", (*counter)%10);
            fflush(stdout);
            (*counter)++;
            usleep(200000);
            
        }   

        printf("\r%d", (*counter)/10);
        printf("%d", (*counter)%10);
        fflush(stdout);
        usleep(200000);


        // Detach and terminate
        shmdt(counter);
        return 0;

        


    }else{
        pwait(NULL);
        while (*counter > 1) {
            (*counter)--;
            printf("\r%d", (*counter)/10);
            printf("%d", (*counter)%10);
            fflush(stdout);
            usleep(200000);
        }

        printf("\r%d", (*counter)/10);
        printf("%d\n", (*counter)%10);
        fflush(stdout);
        usleep(200000);


        // Detach and remove shared memory segment
        shmdt(counter);
        shmctl(shmid, IPC_RMID, nullptr);

        return 0;
        
    }

}