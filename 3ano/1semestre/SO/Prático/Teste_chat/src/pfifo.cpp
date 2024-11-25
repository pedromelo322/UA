#include <dbc.h>
#include <string.h>
#include "pfifo.h"

#include "thread.h"

static void print_pfifo(PriorityFIFO* pfifo);
static int empty_pfifo(PriorityFIFO* pfifo);
static int full_pfifo(PriorityFIFO* pfifo);

// Inicialização da fila de pedidos
void init_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   memset(pfifo->array, 0, sizeof(pfifo->array));
   pfifo->inp = pfifo->out = pfifo->cnt = 0;
   pfifo->is_closed = 0;

   mutex_init(&pfifo->access, NULL);
   cond_init(&pfifo->notEmpty_or_closed, NULL);
   cond_init(&pfifo->notFull_or_closed, NULL);

}

// Encerramento da fila de pedidos
void term_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   require(is_closed_pfifo(pfifo), "FIFO open");

   mutex_destroy(&pfifo->access);
   cond_destroy(&pfifo->notEmpty_or_closed);
   cond_destroy(&pfifo->notFull_or_closed);
}

// Inserção de um pedido na fila com prioridade
void insert_pfifo(PriorityFIFO* pfifo, int id, int priority) {


   mutex_lock(&pfifo->access);

   while(full_pfifo(pfifo) && !pfifo->is_closed){
      cond_wait(&pfifo->notFull_or_closed, &pfifo->access);
   }

   require(pfifo != NULL, "NULL pointer to FIFO");
   require(id >= 0 && id <= MAX_ID, "invalid id");
   require(priority > 0 && priority <= MAX_PRIORITY, "invalid priority value");
   require(pfifo->is_closed || !full_pfifo(pfifo), "open FIFO is full");


   if (!pfifo->is_closed) {
      int idx = pfifo->inp;
      int prev = (idx + FIFO_MAXSIZE - 1) % FIFO_MAXSIZE;
      while ((idx != pfifo->out) && (pfifo->array[prev].priority > priority)) {
         pfifo->array[idx] = pfifo->array[prev];
         idx = prev;
         prev = (idx + FIFO_MAXSIZE - 1) % FIFO_MAXSIZE;
      }
      pfifo->array[idx].id = id;
      pfifo->array[idx].priority = priority;
      pfifo->inp = (pfifo->inp + 1) % FIFO_MAXSIZE;
      pfifo->cnt++;
   }

   cond_broadcast(&pfifo->notEmpty_or_closed);
   mutex_unlock(&pfifo->access);
}

// Retirada do pedido mais prioritário
int retrieve_pfifo(PriorityFIFO* pfifo) {

   mutex_lock(&pfifo->access);

   while(empty_pfifo(pfifo) && !pfifo->is_closed){
      cond_wait(&pfifo->notEmpty_or_closed, &pfifo->access);
   }

   require(pfifo != NULL, "NULL pointer to FIFO");
   require(pfifo->is_closed || !empty_pfifo(pfifo), "open FIFO is empty");

   int result = -1;
   if (!pfifo->is_closed) {
      result = pfifo->array[pfifo->out].id;
      pfifo->array[pfifo->out].id = INVALID_ID;
      pfifo->array[pfifo->out].priority = INVALID_PRIORITY;
      pfifo->out = (pfifo->out + 1) % FIFO_MAXSIZE;
      pfifo->cnt--;
      int idx = pfifo->out;
      for (int i = 1; i <= pfifo->cnt; i++) {
         if (pfifo->array[idx].priority > 1 && pfifo->array[idx].priority != INVALID_PRIORITY)
            pfifo->array[idx].priority--;
         idx = (idx + 1) % FIFO_MAXSIZE;
      }
   }
   cond_broadcast(&pfifo->notFull_or_closed);
   mutex_unlock(&pfifo->access);
   ensure((result >= 0 && result <= MAX_ID) || is_closed_pfifo(pfifo), "OPEN FIFO with an invalid id");
   
   return result;
}

// Fechar a fila de pedidos
void close_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   require(!is_closed_pfifo(pfifo), "FIFO already closed");

   mutex_lock(&pfifo->access);

   pfifo->is_closed = 1;

   cond_broadcast(&pfifo->notEmpty_or_closed);
   cond_broadcast(&pfifo->notFull_or_closed);
   mutex_unlock(&pfifo->access);
}

// Verificar se a fila está fechada
int is_closed_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");

   mutex_lock(&pfifo->access);

   int result = pfifo->is_closed;

   mutex_unlock(&pfifo->access);

   return result;
}

// Fila vazia
static int empty_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   return pfifo->cnt == 0;
}

// Fila cheia
static int full_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   return pfifo->cnt == FIFO_MAXSIZE;
}

// Imprimir fila de pedidos
static void print_pfifo(PriorityFIFO* pfifo) {
   require(pfifo != NULL, "NULL pointer to FIFO");
   int idx = pfifo->out;
   for (int i = 1; i <= pfifo->cnt; i++) {
      printf("Pedido %d: id=%d, prioridade=%d\n", i, pfifo->array[idx].id, pfifo->array[idx].priority);
      idx = (idx + 1) % FIFO_MAXSIZE;
   }
}