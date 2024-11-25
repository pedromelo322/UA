#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

int decrement(int* counter, pthread_mutex_t* access, pthread_cond_t* cond, int* turn, int thread_id) {
    while (1) {
        pthread_mutex_lock(access);

        // Aguarda a vez correta para a thread atual
        while (*turn != thread_id) {
            pthread_cond_wait(cond, access);
        }

        // Alterna a vez para a outra thread
        *turn = 1 - thread_id;

        // Verifica se o contador chegou a 1, para finalizar o loop
        if (*counter <= 1) {
            pthread_mutex_unlock(access);
            pthread_cond_broadcast(cond); // Sinaliza para qualquer thread restante
            return EXIT_SUCCESS;
        }

        // Decrementa e imprime o valr do contador
        (*counter)--;
        printf("TID: %d -- Counter: %d\n", gettid(), *counter);
        fflush(stdout);
        usleep(100000);


        pthread_cond_broadcast(cond);  // Notifica a outra thread

        pthread_mutex_unlock(access);
    }
}

struct childData {
    int *counter;
    pthread_mutex_t *access;
    pthread_cond_t *cond;
    int *turn;
    int thread_id;
};

void* childThread(void* arg) {
    struct childData *p = (struct childData*)arg;
    decrement(p->counter, p->access, p->cond, p->turn, p->thread_id);
    pthread_exit(NULL);
    return NULL;
}

int main(void) {
    int value;

    do {
        printf("Valor entre 10 e 20: ");
        scanf("%d", &value);    
    } while (value < 10 || value > 20);

    int counter = value;
    pthread_mutex_t access;
    pthread_cond_t cond;
    int turn = 0; // Variável para alternar a vez entre threads

    // Inicializa o mutex e a variável condicional
    pthread_mutex_init(&access, NULL);
    pthread_cond_init(&cond, NULL);

    pthread_t ncth[2];
    struct childData data[2]; 

    // Cria duas threads com informações específicas
    for (int i = 0; i < 2; i++) {
        data[i].counter = &counter;
        data[i].access = &access;
        data[i].cond = &cond;
        data[i].turn = &turn;
        data[i].thread_id = i;
        pthread_create(&ncth[i], NULL, childThread, &data[i]);
    }

    // Espera que ambas as threads terminem
    for (int i = 0; i < 2; i++) {
        pthread_join(ncth[i], NULL);
    }

    // Destroi o mutex e a variável condicional
    pthread_mutex_destroy(&access);
    pthread_cond_destroy(&cond);

    return 0;
}
