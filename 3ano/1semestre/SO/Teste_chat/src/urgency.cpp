#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>
#include <unistd.h>
#include <sys/types.h>
#include <math.h>
#include <utils.h>
#include "pfifo.h"
#include "settings.h"


#include "thread.h"

/* DO NOT CHANGE THE FOLLOWING VALUES, run program with option -h to set a different values */

static int npedidos = 4;  ///< número de pedidos
static int nchefs = 1;    ///< número de chefs

#define USAGE "Uso: %s [-p npedidos] [-c nchefs] [-h]\n \
      \t-p npedidos: número de pedidos a serem processados\n \
      \t-c nchefs: número de chefs no restaurante\n \
      \t-h: mostra esta ajuda e termina\n"

typedef struct {
   char nome[MAX_NAME+1];
   int pronto; // 0: aguardando preparo; 1: pedido pronto

   pthread_mutex_t mutex;
   pthread_cond_t waiting;

} Pedido;

typedef struct {
   int num_pedidos;
   Pedido todos_pedidos[MAX_PEDIDOS];
   PriorityFIFO fila_pedidos;

} RestauranteData;

RestauranteData * rd = NULL;

void init_simulacao(int np);
void term_simulacao();
int chef_iteration(int id);
void cliente_faz_pedido(int id);
void cliente_espera_pedido(int id);
void cliente_vida(int id);
void random_wait();

void init_simulacao(int np) {
   printf("Iniciando simulação do restaurante\n");
   rd = (RestauranteData*)malloc(sizeof(RestauranteData));
   memset(rd, 0, sizeof(RestauranteData));
   rd->num_pedidos = np;
   init_pfifo(&rd->fila_pedidos);


   for (int i=0; i < MAX_PEDIDOS; i++){
      mutex_init(&rd->todos_pedidos[i].mutex, NULL);
      cond_init(&rd->todos_pedidos[i].waiting, NULL);
   }
}

void term_simulacao() {
   printf("Liberando recursos\n");

   for (int i=0; i < MAX_PEDIDOS; i++){
      mutex_destroy(&rd->todos_pedidos[i].mutex);
      cond_destroy(&rd->todos_pedidos[i].waiting);
   }

   term_pfifo(&rd->fila_pedidos);
   free(rd);
   rd = NULL;
}

int chef_iteration(int id) {
   printf("\e[34;01mChef %d: preparando próximo pedido\e[0m\n", id);
   int pedido = retrieve_pfifo(&rd->fila_pedidos);
   if (pedido != -1) {
      printf("\e[32;01mChef %d: preparando pedido %d\e[0m\n", id, pedido);
      random_wait();
      printf("\e[32;01mChef %d: pedido %d pronto\e[0m\n", id, pedido);

      mutex_lock(&rd->todos_pedidos[pedido].mutex);

      rd->todos_pedidos[pedido].pronto = 1;

      cond_broadcast(&rd->todos_pedidos[pedido].waiting);
      mutex_unlock(&rd->todos_pedidos[pedido].mutex);
      return 0;
   }
   return -1;
   
}

void cliente_faz_pedido(int id) {
   Pedido* pedido = &rd->todos_pedidos[id];
   strcpy(pedido->nome, "Pedido");
   pedido->pronto = 0;
   printf("\e[30;01mCliente %d: faz um pedido ao restaurante\e[0m\n", id);
   insert_pfifo(&rd->fila_pedidos, id, rand() % 3 + 1);
}

void cliente_espera_pedido(int id) {
   printf("\e[30;01mCliente %d: pedido pronto, servindo cliente\e[0m\n", id);
   mutex_lock(&rd->todos_pedidos[id].mutex);
   while(rd->todos_pedidos[id].pronto != 1){
      cond_wait(&rd->todos_pedidos[id].waiting, &rd->todos_pedidos[id].mutex);
   }
   mutex_unlock(&rd->todos_pedidos[id].mutex);
}

void cliente_vida(int id) {
   cliente_faz_pedido(id);
   cliente_espera_pedido(id);
}


void *thread_cliente(void* arg){
   int *p = (int *)arg;
   cliente_vida(*p);
   return NULL;
}

void *thread_chefe(void* arg){
   int *p = (int *)arg;
   while(chef_iteration(*p) != -1);
   return NULL;
}



int main(int argc, char *argv[]) {
   int option;
   while ((option = getopt(argc, argv, "p:c:h")) != -1) {
      switch (option) {
         case 'p':
            npedidos = atoi(optarg);
            break;
         case 'c':
            nchefs = atoi(optarg);
            break;
         case 'h':
            printf(USAGE, basename(argv[0]));
            return EXIT_SUCCESS;
         default:
            return EXIT_FAILURE;
      }
   }
   srand(getpid());
   init_simulacao(npedidos);





   pthread_t cpth[nchefs];
   int idsc[nchefs];
   for (int i = 0; i < nchefs; i++) {
      printf("\n");
      idsc[i] = i;
      random_wait();
      thread_create(&cpth[i], NULL, thread_chefe, &idsc[i]);
   }

   pthread_t ppth[npedidos];
   int idsp[npedidos];
   for (int i = 0; i < npedidos; i++) {
      printf("\n");
      idsp[i] = i;
      random_wait();
      thread_create(&ppth[i], NULL, thread_cliente, &idsp[i]);
   }

   for (int i = 0; i < npedidos; i++){
      thread_join(ppth[i], NULL);
      printf("Thread Cliente %d terminada\n", i);
   }

   close_pfifo(&rd->fila_pedidos);

   for (int i = 0; i < nchefs; i++){
      thread_join(cpth[i], NULL);
      printf("Thread Chefe %d terminada\n", i);
   }


   term_simulacao();
   return EXIT_SUCCESS;
}

void random_wait() {
   usleep((useconds_t)random_int(0, MAX_WAIT));
}