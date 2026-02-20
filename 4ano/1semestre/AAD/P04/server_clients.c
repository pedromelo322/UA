//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// server/client example
// * for the server code, compile with -DSERVER=1
// * for the client code, compile with -DSERVER=0
//
// TODO: make things more robust (handle unexpected server or client deaths, malicious clients, etc.)
//

#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/select.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#ifndef SERVER
# define SERVER  0
#endif


//
// common code: write to and read from a socket
//
// write_data() and read_data() return 0 when all is well and return a negative value on error
//
// uses select, with a time out, to wait until it is possible to read from or write to the socket
// uses a while loop, because send() and recv() may not do it all in one go
//

static int write_data(int socket_fd,void *data,size_t data_size)
{
  struct timeval time_out;
  fd_set w_mask,e_mask;
  ssize_t bytes_written;

  while(data_size > (size_t)0)
  {
    FD_ZERO(&w_mask);
    FD_SET(socket_fd,&w_mask);
    FD_ZERO(&e_mask);
    FD_SET(socket_fd,&e_mask);
    time_out.tv_sec = 10; // 10 seconds
    time_out.tv_usec = 0;
    (void)select(socket_fd + 1,NULL,&w_mask,&e_mask,&time_out); // block if no data can be sent
    if(FD_ISSET(socket_fd,&w_mask) == 0)
      return -1; // either error or time out
    bytes_written = send(socket_fd,data,data_size,0);
    if(bytes_written <= (ssize_t)0)
      return -2; // write error
    data += bytes_written;
    data_size -= bytes_written;
  }
  return 0; // ok
}

static int read_data(int socket_fd,void *data,size_t data_size)
{
  struct timeval time_out;
  fd_set r_mask,e_mask;
  ssize_t bytes_read;

  while(data_size > (size_t)0)
  {
    FD_ZERO(&r_mask);
    FD_SET(socket_fd,&r_mask);
    FD_ZERO(&e_mask);
    FD_SET(socket_fd,&e_mask);
    time_out.tv_sec = 10; // 10 seconds
    time_out.tv_usec = 0;
    (void)select(socket_fd + 1,&r_mask,NULL,&e_mask,&time_out); // block if no data can be read
    if(FD_ISSET(socket_fd,&r_mask) == 0)
      return -1; // either error or time out
    bytes_read = recv(socket_fd,data,data_size,0);
    if(bytes_read <= (ssize_t)0)
      return -2; // read error
    data += bytes_read;
    data_size -= bytes_read;
  }
  return 0; // ok
}


//
// server code: set up the server socket to wait for connections; errors are fatal
//
// IPv4, TCP/IP, listen backlog of 2 (should be enough when server/client messages connections take a small amount of time)
//

#if SERVER != 0
static int setup_server(int port_number)
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
#endif


//
// server code: return a new file descriptor (in this case a socket) from a listening socket; errors are ignored
//

#if SERVER != 0
static int get_connection(int listen_fd,char connection_ipv4_address[32])
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
#endif


//
// client code: connect to the server; errors are fatal (errors in connect() could perhaps be handled by trying again later...)
//

#if SERVER == 0
static int connect_to_server(char *ip_address,int port_number)
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
#endif


//
// common code: close a socket
//

static void close_socket(int socket_fd)
{
  if(close(socket_fd) < 0)
  {
    perror("close_socket(): close");
    exit(1);
  }
}


//
// common code: read and write messages
//
// to simplify things, all messages exchanged between the server and each client are always an array of unsigned integers
//
// fucking hell! the l in htonl() and ntohl() actually mean that the argument is an unsigned integer and not an unsigned long
//

#define max_message_size 7u

typedef struct
{
  unsigned int message_size;
  unsigned int data[max_message_size];
}
message_t;

static int send_message(int socket_fd,message_t *m)
{
  int r,s;

  if(m == NULL || (s = m->message_size) > max_message_size)
    return -10;
  // convert to network byte order
  m->message_size = htonl(m->message_size);
  for(unsigned int i = 0u;i < s;i++)
    m->data[i] = htonl(m->data[i]);
  // send
  r = write_data(socket_fd,(void *)m,(size_t)(1u + s) * sizeof(unsigned int));
  // convert back to host byte order
  m->message_size = ntohl(m->message_size);
  for(unsigned int i = 0u;i < s;i++)
    m->data[i] = ntohl(m->data[i]);
  // done
  return r;
}

static int receive_message(int socket_fd,message_t *m)
{
  int r,s;

  if(m == NULL)
    return -10;
  // get the message size
  r = read_data(socket_fd,(void *)&(m->message_size),sizeof(unsigned int));
  if(r < 0)
    return r;
  s = m->message_size = ntohl(m->message_size);
  if(s > max_message_size)
    return -11;
  // get the message contents
  r = read_data(socket_fd,(void *)&(m->data[0]),(size_t)s * sizeof(unsigned int));
  if(r < 0)
    return r;
  for(unsigned int i = 0u;i < s;i++)
    m->data[i] = ntohl(m->data[i]);
  // done
  return 0;
}


//
// server code: the main server code (to simplify things, it accepts only one connection from a client at a time)
//
// using an alarm, we force the server to shutdown after 15 minutes, so if you forget to kill the server process, it will die by itself :-)
//

#if SERVER != 0
void alarm_signal_handler(int dummy)
{ // the signal handler for SIGALRM; just terminate the program
  exit(1);
}
#endif

#if SERVER != 0
int main(int argc,char **argv)
{
# define number_of_work_items  50
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
#endif


//
// client code: the main client code
//

#if SERVER == 0
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
#endif
