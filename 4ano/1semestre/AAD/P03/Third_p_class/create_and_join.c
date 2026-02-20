//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// OpemMP parallelization
// * of a block of code
// * of a for cycle
//

#include <omp.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>


//
// number of threads
//

#ifndef n_threads
# define n_threads   4
#endif
#if n_threads < 2 || n_threads > 16
# error "too few or too many threads"
#endif
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
// main program
//

int main(void)
{
  //
  // run a block of code in parallel
  //
# pragma omp parallel num_threads(n_threads)
  {
    printf("hello from the block code from thread %d\n",omp_get_thread_num());
  }
  //
  // run a for cycle in parallel
  //
# pragma omp parallel for num_threads(n_threads)
  for(int i = 0;i < 5 * n_threads;i++)
    printf("i=%d from thread %d\n",i,omp_get_thread_num());
  //
  // the adaptation to OpenMP of the pthreads create_and_join of the previous class
  //
  printf("main: start at %.6f\n",wall_time());
  int work_to_do[n_threads];
  int return_value[n_threads];
  for(int idx = 0;idx < n_threads;idx++)
    work_to_do[idx] = 100000000 * (n_threads_max + 1 - idx);
# pragma omp parallel num_threads(n_threads)
  { // automatic variable are local to the thread
    int thread_number = omp_get_thread_num();
    printf("%4d: hello\n",thread_number);
    printf("%4d: start at %.6f\n",thread_number,wall_time());
    int count = work_to_do[thread_number];
    unsigned int val = 0u;
    for(int idx = 0;idx < count;idx++)
      val = 13u * val + 1u;
    return_value[thread_number] = (int)(val & 0x3FFFFFFFu);
    printf("%4d: end   at %.6f\n",thread_number,wall_time());
  }
  printf("main: end at %.6f\n",wall_time());
  printf("computed values:\n");
  for(int idx = 0;idx < n_threads;idx++)
    printf("  %2d: %d\n",idx,return_value[idx]);
  //
  // done
  //
  return 0;
}
