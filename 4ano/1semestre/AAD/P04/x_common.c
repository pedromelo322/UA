//
// Tomás Oliveira e Silva,  October 2024
//
// Arquiteturas de Alto Desempenho 2024/2025
//
// server/client common code (.c file)
//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#include "x_common.h"


//
// common code: write to and read from a socket
//
// write_data() and read_data() return 0 when all is well and return a negative value on error
//
// uses select, with a time out, to wait until it is possible to read from or write to the socket
// uses a while loop, because send() and recv() may not do it all in one go
//

int write_data(int socket_fd,void *data,size_t data_size)
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

int read_data(int socket_fd,void *data,size_t data_size)
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
// common code: close a socket
//

void close_socket(int socket_fd)
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

int send_message(int socket_fd,message_t *m)
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

int receive_message(int socket_fd,message_t *m)
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
