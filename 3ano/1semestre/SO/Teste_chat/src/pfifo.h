#ifndef PFIFO_H
#define PFIFO_H

#include <stdint.h>
#include "settings.h"

typedef struct {
   struct {
      int id;         // element ID (works as an index in array all_patients)
      int priority;   // patient priority in FIFO
   } array[FIFO_MAXSIZE];
   int inp;  ///< point of insertion (queue tail)
   int out;  ///< point of retrieval (queue head)
   int cnt;  ///< number of items stored
   int is_closed; ///< true when closed

   pthread_mutex_t access;
   pthread_cond_t notFull_or_closed, notEmpty_or_closed;

} PriorityFIFO;

void init_pfifo(PriorityFIFO* pfifo);
void term_pfifo(PriorityFIFO* pfifo);
void insert_pfifo(PriorityFIFO* pfifo, int id, int priority);
int retrieve_pfifo(PriorityFIFO* pfifo);
void close_pfifo(PriorityFIFO* pfifo);
int is_closed_pfifo(PriorityFIFO* pfifo);

#endif // PFIFO_H