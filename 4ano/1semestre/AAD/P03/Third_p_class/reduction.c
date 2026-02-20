//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// OpemMP parallelization reduction
// * add in parallel using a reduction
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
  const int array_size = 1000;
  int array[array_size];

  //
  // set the default number of threads
  //
  omp_set_num_threads(n_threads);
  //
  // initialize array (in parallel :-)
  //
# pragma omp parallel for
  for(int idx = 0;idx < array_size;idx++)
    array[idx] = idx;
  //
  // add the array contents in parallel
  // * partial sums in different variables
  // * locks only at the end to update the reduction variable
  //
  int sum = 0;
# pragma omp parallel for reduction(+:sum)
  for(int idx = 0;idx < array_size;idx++)
    sum += array[idx];
  printf("sum=%d (expected %d)\n",sum,(array_size * (array_size - 1)) >> 1);
  //
  // done
  //
  return 0;
}
