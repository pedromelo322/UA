//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// server/client common code (.h file)
//

#ifndef X_COMMON

#define X_COMMON

//
// socket-related stuff
//

int write_data(int socket_fd,void *data,size_t data_size);
int read_data(int socket_fd,void *data,size_t data_size);
void close_socket(int socket_fd);

//
// message-related stuff
//

#define max_message_size  7u

typedef struct
{
  unsigned int message_size;
  unsigned int data[max_message_size];
}
message_t;

int send_message(int socket_fd,message_t *m);
int receive_message(int socket_fd,message_t *m);

#endif
