//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// client code (.c file)
//
// TODO: make things more robust (handle unexpected server or client deaths, malicious clients, etc.)
//

#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "x_common.h"
#include "x_client.h"


//
// client code: connect to the server; errors are fatal (errors in connect() could perhaps be handled by trying again later...)
//

int connect_to_server(char *ip_address,int port_number)
{
  struct sockaddr_in peer_address;
  int connection_fd;
  in_addr_t address;

  connection_fd = socket(AF_INET,SOCK_STREAM,0);
  if(connection_fd == -1)
  {
    perror("connect_to_server(): socket");
    exit(1);
  }
  address = inet_addr(ip_address);
  if(address == (in_addr_t)-1)
  {
    perror("connect_to_server(): inet_addr");
    exit(1);
  }
  peer_address.sin_family = AF_INET;
  peer_address.sin_addr.s_addr = address;
  peer_address.sin_port = htons(port_number);
  if(connect(connection_fd,(struct sockaddr *)&peer_address,(socklen_t)sizeof(struct sockaddr)) == -1)
  {
    perror("connect_to_server(): connect");
    exit(1);
  }
  return connection_fd;
}


//
// client code: the main client code
//

int main(int argc,char **argv)
{
  unsigned int work_idx,work_id,result,valid;
  char *server_address;
  int port_number;

  //
  // command line stuff
  //
  if(argc != 3)
  {
usage:
    fprintf(stderr,"usage: %s server-address port_number  # 49152 <= port_number <= 65535\n",argv[0]);
    exit(1);
  }
  server_address = argv[1];
  port_number = atoi(argv[2]);
  if(port_number < 49152 || port_number > 65535)
    goto usage;
  //
  // talk with the server (on a loop, until there is no more work to be done)
  //
  work_idx = work_id = result = valid = 0u;
  for(;;)
  {
    int connection_fd;
    char *report;
    message_t m;
 
    connection_fd = connect_to_server(server_address,port_number);
    printf("talking with the server (%s)\n",server_address);
    // the client sends a message to either request more work or to send work completion data
    report = NULL;
    if(valid == 0u)
    {
      m.message_size = 0u;
      printf("  the client says: give me work to do\n");
    }
    else
    {
      m.message_size = 3u;
      m.data[0] = work_idx;
      m.data[1] = work_id;
      m.data[2] = result;
      printf("  the client says: here go the results of the work item with index %u [result=%u]\n",work_idx,result);
    }
    if(send_message(connection_fd,&m) < 0)
    {
      report = "client->server communication error";
      goto terminate_connection;
    }
    // give a work item to the client: data[0]=index, data[1]=work_id; if there is no work item, the message length is 0
    if(receive_message(connection_fd,&m) < 0)
    {
      report = "server->client communication error";
      goto terminate_connection;
    }
    switch(m.message_size)
    {
      case 0: // no more work
        valid = 0u;
        printf("  the server says: there is no more work to do, please exit\n");
        break;
      case 2: // the client sent work completion data: data[0]=index, data[1]=work_id, data[2]=result
        valid = 1u;
        work_idx = m.data[0];
        work_id = m.data[1];
        printf("  the server says: please do the work item with index %u\n",work_idx);
        break;
      default:
        report = "unexpected message size";
        goto terminate_connection;
    }
terminate_connection:
    close_socket(connection_fd);
    printf("  done --- %s\n",(report == NULL) ? "all is well" : report);
    // if requested, exit (the loop, and after that, the program)
    if(valid == 0u)
      break;
    // do the requested work
    result = 0u;
    for(unsigned int idx = 0u;idx < work_id;idx++)
      result = 13u * result + 1u;
  }
  //
  // finish
  //
  return 0;
}
