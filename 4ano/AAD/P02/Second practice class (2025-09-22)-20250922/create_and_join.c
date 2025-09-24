//
// Tomás Oliveira e Silva,  September 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// thread creation and destruction
// * passing arguments to threads
// * returning values from threads
//

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/types.h>
#include <unistd.h>


//
// minimum and maximum number of threads
//

#define n_threads_min   2
#define n_threads_max  16


//
// wall time (POSIX)
//

static double wall_time(void)
{
  struct timespec current_time;

  if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
    exit(1); // silent exit: clock_gettime() failed!!!
  return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
}


//
// data type used to pass data to/from threads
//
// adjust it to your needs
//

typedef struct
{
  pthread_t tid;     // thread identifier (placing it here simplifies things) --- linux implementation: it appears to be a memory address...
  int thread_number; // example of input argument (thread number)
  int work_to_do;    // example of input argument (integer that encodes what has to be done by the thread --- could have been an enumerated type)
  int return_value;  // example of output argument (result of the computation; it is a scalar in this example)
}
thread_data_t;


//
// example of a worker thread
//
// each printf() call is atomic (no interference from other threads)
// however, output from consecutive printf() calls from the same thread may be mixed with printf() calls from other threads
// so, when you want to print something that you want to appear in one piece, do it all in the same printf() call
//

void *worker_thread(void *arg)
{
  thread_data_t *td = (thread_data_t *)arg; // td -> abbreviation of thread_data
  unsigned int val = 0u;
  int idx,count;

  printf("%4d: hello [tid=%lX]\n",td->thread_number,(long)td->tid);
  printf("%4d: start at %.6f\n",td->thread_number,wall_time());
  count = td->work_to_do; // number of iterations
  for(idx = 0;idx < count;idx++)
    val = 13u * val + 1u; // linear congruential generator (https://en.wikipedia.org/wiki/Linear_congruential_generator)
  td->return_value = (int)(val & 0x3FFFFFFFu);
  printf("%4d: end   at %.6f\n",td->thread_number,wall_time());
  return NULL; // here be dragons (it is best to not use this --- pointer to pointer)
}


//
// main program
//

int main(int argc,char **argv)
{
  thread_data_t td[n_threads_max];
  int idx,n_threads = 2;

  if(argc > 1)                  n_threads = atoi(argv[1]);
  if(n_threads < n_threads_min) n_threads = n_threads_min;
  if(n_threads > n_threads_max) n_threads = n_threads_max;
  printf("main: start at %.6f\n",wall_time());
  // initialize thread data
  for(idx = 0;idx < n_threads;idx++)
  {
    td[idx].thread_number = idx;
    td[idx].work_to_do = 100000000 * (n_threads_max + 1 - idx);
  }
  // create threads
  for(idx = 0;idx < n_threads;idx++)
    if(pthread_create(&td[idx].tid,NULL,worker_thread,(void *)&td[idx]) != 0)
    {
      fprintf(stderr,"pthread_create() failed for idx=%d\n",idx);
      exit(1);
    }
  // wait for completion (in this case, in the same order the threads were created)
  // * pthread_join() blocks execution until the thread terminates
  //   meanwhile, other threads may have terminated
  // * use pthread_tryjoin_np() if you desire to return immediately (with an error code) when a thread has not yet terminated
  for(idx = 0;idx < n_threads;idx++)
    if(pthread_join(td[idx].tid,NULL) != 0)
    {
      fprintf(stderr,"pthread_join() failed for idx=%d\n",idx);
      exit(1);
    }
  printf("main: end at %.6f\n",wall_time());
  printf("computed values:\n");
  for(idx = 0;idx < n_threads;idx++)
    printf("  %2d: %d\n",idx,td[idx].return_value);
  return 0;
}
