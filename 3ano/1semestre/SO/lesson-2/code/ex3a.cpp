#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/types.h>
#include "process.h"

int main(int argc , char* argv [])
{

    execlp("kill", "kill", "-15", argv[1], NULL);

}