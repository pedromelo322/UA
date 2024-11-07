#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
/* return status */
int status;
/* child thread */
void *threadChild(void *arg)
{
	printf("I'm the child thread!\n");
	sleep(1);
	status = EXIT_SUCCESS;
	pthread_exit(&status);
}
 
 
int main(int argc, char *argv[])
{
	/* launching the child thread */
	pthread_t thr;
	if (pthread_create(&thr, NULL, threadChild, NULL) != 0)
	{
		perror("Fail launching thread");
		return EXIT_FAILURE;
	}
	/* waits for child termination */
	if (pthread_join(thr, NULL) != 0)
	{
		perror("Fail joining child");
		return EXIT_FAILURE;
	}
	printf("Child ends; status %d.\n", status);
	return EXIT_SUCCESS;
}