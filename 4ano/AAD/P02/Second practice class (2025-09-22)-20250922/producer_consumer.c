//
// Tomás Oliveira e Silva,  September 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// condition variables in a producer/comsumer problem
//
// TODO: terminate the consumer threads in a clean way
//
// the text output appears in a really weird order...
//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

#ifndef n_producers
#define  n_producers  4
#endif
#if n_producers < 2 || n_producers > 16
# error "too few or too many producers"
#endif
#ifndef n_consumers
#define  n_consumers  4
#endif
#if n_consumers < 2 || n_consumers > 16
# error "too few or too many consumers"
#endif


//
// a simple producer/consumer queue
//

#define queue_size  32

typedef struct
{
  pthread_mutex_t lock;    // global lock
  pthread_cond_t producer; // producer condition variable
  pthread_cond_t consumer; // consumer condition variable
  int n_items;             // number of items in the queue
  int read_pos;            // queue read position
  int write_pos;           // queue write position
  int data[queue_size];    // queue data (circular buffer)
}
queue_t;

static queue_t q =
{
  .lock      = PTHREAD_MUTEX_INITIALIZER,
  .producer  = PTHREAD_COND_INITIALIZER,
  .consumer  = PTHREAD_COND_INITIALIZER,
  .n_items   = 0,
  .read_pos  = 0,
  .write_pos = 0
};

#define LOCK()      do if(pthread_mutex_lock(&q.lock)            != 0) { fprintf(stderr,"pthread_mutex_lock() failed\n");                  exit(1); } while(0)
#define UNLOCK()    do if(pthread_mutex_unlock(&q.lock)          != 0) { fprintf(stderr,"pthread_mutex_unlock() failed\n");                exit(1); } while(0)
#define SIGNAL_P()  do if(pthread_cond_broadcast(&q.producer)    != 0) { fprintf(stderr,"pthread_cond_broadcast() failed --- producer\n"); exit(1); } while(0)
#define WAIT_P()    do if(pthread_cond_wait(&q.producer,&q.lock) != 0) { fprintf(stderr,"pthread_cond_wait() failed --- producer\n");      exit(1); } while(0)
#define SIGNAL_C()  do if(pthread_cond_broadcast(&q.consumer)    != 0) { fprintf(stderr,"pthread_cond_broadcast() failed --- consumer\n"); exit(1); } while(0)
#define WAIT_C()    do if(pthread_cond_wait(&q.consumer,&q.lock) != 0) { fprintf(stderr,"pthread_cond_wait() failed --- consumer\n");      exit(1); } while(0)

static void *producer_thread(void *arg)
{
  int producer_id = *(int *)arg;
  for(int serial_number = 0;serial_number < 10;serial_number++)
  {
    LOCK();
    while(q.n_items == queue_size) // the while loop protects against spurious activations...
      WAIT_P();                    // full, wait
    q.data[q.write_pos] = (producer_id << 16) + serial_number;
    q.write_pos = (q.write_pos + 1 < queue_size) ? q.write_pos + 1 : 0;
    q.n_items++;
    SIGNAL_C();                    // not empty, wake a consumer
    UNLOCK();
  }
  return NULL;
}

static void *consumer_thread(void *arg)
{
  int consumer_id = *(int *)arg;
  for(;;)
  { // TODO: incomplete solution; we need a robust termination condition!
    LOCK();
    while(q.n_items == 0)          // the while loop protects against spurious activations...
      WAIT_C();                    // empty, wait
    int item = q.data[q.read_pos];
    q.read_pos = (q.read_pos + 1 < queue_size) ? q.read_pos + 1 : 0;
    q.n_items--;
    SIGNAL_P();                    // not full, wake a producer
    UNLOCK();
    fprintf(stderr,"C=%02d P=%02d serial=%02d\n",consumer_id,item >> 16,item % (1 << 16));
  }
}


//
// main program
//

int main(int argc,char **argv)
{
  pthread_t consumer_tid[n_consumers]; int consumer_id[n_consumers];
  pthread_t producer_tid[n_producers]; int producer_id[n_consumers];
  int idx;

  q.read_pos = q.write_pos = q.n_items = 0;
  // create threads
  for(idx = 0;idx < n_consumers;idx++)
  {
    consumer_id[idx] = idx;
    if(pthread_create(&consumer_tid[idx],NULL,consumer_thread,&consumer_id[idx]) != 0) exit(1); // silent exit
  }
  for(idx = 0;idx < n_producers;idx++)
  {
    producer_id[idx] = idx;
    if(pthread_create(&producer_tid[idx],NULL,producer_thread,&producer_id[idx]) != 0) exit(1); // silent exit
  }
  // wait for completion
  for(idx = 0;idx < n_producers;idx++)
    if(pthread_join(producer_tid[idx],NULL) != 0) exit(1); // silent exit
  sleep(1u); // TODO:  this will hopefully allow all consumers to terminate emptying the queue
  exit(0);
}
