//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// OpenMP critical regions
//

#include <omp.h>
#include <stdio.h>


//
// number of threads
//

#ifndef n_threads
# define n_threads   4
#endif
#if n_threads < 2 || n_threads > 16
# error "too few or too many threads"
#endif


//
// main program
//

int main(void)
{
  volatile int shared_counter;         // the shared counter (declared volatile, so the compiler does not optimize acesses to it)
  const int loop_iterations = 1000000; // number of times each thread increments the shared counter

  //
  // set the default number of threads
  //
  omp_set_num_threads(n_threads);
  //
  // increment the counter without a critical region
  //
  shared_counter = 0;
# pragma omp parallel
  {
    for(int idx = 0;idx < loop_iterations;idx++)
      shared_counter++;
  }
  printf("shared_counter=%d (expected %d)\n",shared_counter,n_threads * loop_iterations);
  //
  // increment the counter with a critical region
  //
  shared_counter = 0;
# pragma omp parallel
  {
    for(int idx = 0;idx < loop_iterations;idx++)
#   pragma omp critical (lock_increment_unlock)
    {
      shared_counter++;
    }
  }
  printf("shared_counter=%d (expected %d)\n",shared_counter,n_threads * loop_iterations);
  //
  // done
  //
  return 0;
}
