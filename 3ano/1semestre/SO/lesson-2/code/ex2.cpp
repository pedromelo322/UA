#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "delays.h"
#include "process.h"

int main(void)
{

  pid_t ret = pfork();
  if (ret == 0)
  {
    //filho
    execlp("ls", "ls", "-l", NULL);
    perror("execl");
    return EXIT_FAILURE;
  }
  else
  {
    //pai
    //pwait(NULL);
    for (int i = 0; i < 40; i++) printf("=");
    printf("\n");
    

    pwait(NULL);

    for (int i = 0; i < 40; i++) printf("=");
    printf("\n");
  }

  return EXIT_SUCCESS;
}
