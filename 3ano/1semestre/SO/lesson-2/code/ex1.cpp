#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>


#define NTIMES 20

int main(void)
{

    pid_t ret = fork();

    uint32_t min;
    uint32_t max;

    if (ret == 0){
        //filho
        min = 1;
        max = 11;
    }else{
        //pai
        min = 11;
        max = 21;
        usleep(5000000+500000);
    }



    printf("PID = %u\n", getpid());
    for (uint32_t i = min; i < max; i++)
    { 
        printf ("\r%08u ", i);
        fflush (stdout);
        usleep(500000);
    }
    printf ("\n");

    return EXIT_SUCCESS;
}
