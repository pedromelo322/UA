//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// server code (.c file)
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
#include "x_server.h"


//
// server code: set up the server socket to wait for connections; errors are fatal
//
// IPv4, TCP/IP, listen backlog of 2 (should be enough when server/client messages connections take a small amount of time)
//

int setup_server(int port_number)
{
  struct sockaddr_in peer_address;
  int listen_fd;

  listen_fd = socket(AF_INET,SOCK_STREAM,0);
  if(listen_fd == -1)
  {
    perror("setup_server(): socket");
    exit(1);
  }
  peer_address.sin_family = AF_INET;
  peer_address.sin_addr.s_addr = htonl(INADDR_ANY);
  peer_address.sin_port = htons(port_number);
  if(bind(listen_fd,(struct sockaddr *)&peer_address,sizeof(peer_address)) == -1)
  {
    perror("setup_server(): bind");
    exit(1);
  }
  if(listen(listen_fd,2) == -1)
  {
    perror("setup_server(): listen");
    exit(1);
  }
  return listen_fd;
}


//
// server code: return a new file descriptor (in this case a socket) from a listening socket; errors are ignored
//

int get_connection(int listen_fd,char connection_ipv4_address[32])
{
  struct sockaddr_in peer_address;
  socklen_t peer_length;
  int connection_fd;

  do
  {
    peer_length = (socklen_t)sizeof(peer_address);
    connection_fd = accept(listen_fd,(struct sockaddr *)&peer_address,&peer_length);
  }
  while(connection_fd < 0);
  if(connection_ipv4_address != NULL)
    sprintf(connection_ipv4_address,"%.30s",inet_ntoa(peer_address.sin_addr));
  return connection_fd;
}


//
// server code: the main server code (to simplify things, it accepts only one connection from a client at a time)
//
// using an alarm, we force the server to shutdown after 15 minutes, so if you forget to kill the server process, it will die by itself :-)
//

static void alarm_signal_handler(int dummy)
{ // the signal handler for SIGALRM; just terminate the program
  exit(1);
}

int main(int argc,char **argv)
{
# define number_of_work_items  10
  typedef enum { to_be_done,assigned,done } work_item_status_t;
  struct
  {
    work_item_status_t status;
    unsigned int work_id;
    unsigned int result;
  }
  work_items[number_of_work_items];
  int done_work_items;
  int port_number;
  int listen_fd;
  int i;

  //
  // command line stuff
  //
  if(argc != 2)
  {
usage:
    fprintf(stderr,"usage: %s port_number  # 49152 <= port_number <= 65535\n",argv[0]);
    exit(1);
  }
  port_number = atoi(argv[1]);
  if(port_number < 49152 || port_number > 65535)
    goto usage;
  //
  // initialize the work items
  //
  for(i = 0;i < number_of_work_items;i++)
  {
    work_items[i].status = to_be_done;
    work_items[i].work_id = (1u << 31) + ((unsigned int)i << 24); // something different for each work item
  }
  done_work_items = 0;
  //
  // arm the alarm
  //
  (void)signal(SIGALRM,alarm_signal_handler);
  (void)alarm(15u * 60u);
  //
  // talk with clients until all work is done
  //
  listen_fd = setup_server(port_number);
  while(done_work_items < number_of_work_items)
  {
    char connection_ipv4_address[32];
    int connection_fd;
    char *report;
    message_t m;

    printf("waiting for a client to talk to us ...\n");
    connection_fd = get_connection(listen_fd,connection_ipv4_address);
    printf("talking with %s\n",connection_ipv4_address);
    report = NULL;
    // the client sends a message to either request more work or to send work completion data
    if(receive_message(connection_fd,&m) < 0)
    {
      report = "client->server communication error";
      goto terminate_connection;
    }
    switch(m.message_size)
    {
      case 0: // no done work, the client is just asking for some work to do
        printf("  the client says: give me work to do\n");
        break;
      case 3: // the client sent work completion data: data[0]=index, data[1]=work_id, data[2]=result
        if(m.data[0] >= number_of_work_items || m.data[1] != work_items[m.data[0]].work_id || work_items[m.data[0]].status != assigned)
        {
          report = "unexpected client message";
          goto terminate_connection;
        }
        work_items[m.data[0]].result = m.data[2];
        work_items[m.data[0]].status = done;
        done_work_items++;
        printf("  the client says: here go the results of the work item with index %u [result=%u]\n",m.data[0],m.data[2]);
        break;
      default:
        report = "unexpected message size";
        goto terminate_connection;
    }
    // give a work item to the client: data[0]=index, data[1]=work_id; if there is no work item, the message length is 0
    for(i = 0;i < number_of_work_items && work_items[i].status != to_be_done;i++)
      ;
    if(i == number_of_work_items)
      m.message_size = 0u; // no more work
    else
    {
      m.message_size = 2u; // another work item
      m.data[0] = i;
      m.data[1] = work_items[i].work_id;
    }
    if(send_message(connection_fd,&m) < 0)
    {
      report = "server->client communication error";
      goto terminate_connection;
    }
    work_items[i].status = assigned;
    if(i == number_of_work_items)
      printf("  the server says: there is no more work to do, please exit\n");
    else
      printf("  the server says: please do the work item with index %u\n",i);
terminate_connection:
    close_socket(connection_fd);
    printf("  done --- %s\n",(report == NULL) ? "all is well" : report);
  }
  close_socket(listen_fd);
  //
  // finish
  //
  for(i = 0u;i < number_of_work_items;i++)
    printf("%2u %10u %10u\n",i,work_items[i].work_id,work_items[i].result);
  return 0;
}
