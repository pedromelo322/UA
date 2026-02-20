//
// Tomás Oliveira e Silva,  September 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// threads and mutexes, critical regions
//
// the threads just increment a global variable
//

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>


//
// minimum and maximum number of threads
//

#ifndef n_threads
#define  n_threads  4
#endif
#if n_threads < 2 || n_threads > 16
# error "too few or too many threads"
#endif


//
// the thread code and associated global variables
//

static int use_locks = 1;                                // non-zero: use locks,  zero: do not use locks
static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER; // critical section access control -- see also pthread_mutex_init()
static volatile int shared_counter;                      // the shared counter (declared volatile, so the compiler does not optimize acesses to it)

#define LOCK()    do if(pthread_mutex_lock(&lock)   != 0) { fprintf(stderr,"pthread_mutex_lock() failed\n");   exit(1); } while(0)
#define UNLOCK()  do if(pthread_mutex_unlock(&lock) != 0) { fprintf(stderr,"pthread_mutex_unlock() failed\n"); exit(1); } while(0)

#define loop_iterations  1000000
void *worker_thread(void *arg)
{
  for(int idx = 0;idx < loop_iterations;idx++)
  {
    if(use_locks != 0)
      LOCK();
    shared_counter++;
    if(use_locks != 0)
      UNLOCK();
  }
  return NULL;
}


//
// main program
//

int main(int argc,char **argv)
{
  pthread_t tid[n_threads];
  int idx;

  if(argc > 1)
    use_locks = atoi(argv[1]);
  shared_counter = 0;
  // create threads
  for(idx = 0;idx < n_threads;idx++)
    if(pthread_create(&tid[idx],NULL,worker_thread,NULL) != 0)
    {
      fprintf(stderr,"pthread_create() failed for idx=%d\n",idx);
      exit(1);
    }
  // wait for completion
  for(idx = 0;idx < n_threads;idx++)
    if(pthread_join(tid[idx],NULL) != 0)
    {
      fprintf(stderr,"pthread_join() failed for idx=%d\n",idx);
      exit(1);
    }
  // report
  printf("shared_counter=%d (expected %d)\n",shared_counter,n_threads * loop_iterations);
  return 0;
}
