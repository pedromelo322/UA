//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// server code (.h file)
//

#ifndef X_SERVER

#define X_SERVER

int setup_server(int port_number);
int get_connection(int listen_fd,char connection_ipv4_address[32]);
int main(int argc,char **argv);

#endif
