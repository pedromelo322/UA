#
# makefile for the practical class AAD_P04
#

clean:
	rm -f a.out server client
	rm -f x_common.o x_server.o x_client.o x_client x_server

server:		server_clients.c
	cc -Wall -O2 -DSERVER=1 server_clients.c -o server

client:		server_clients.c
	cc -Wall -O2 -DSERVER=0 server_clients.c -o client


x_common.o:	x_common.c x_common.h
	cc -Wall -O2 -c x_common.c -o x_common.o

x_server.o:	x_server.c x_server.h x_common.h
	cc -Wall -O2 -c x_server.c -o x_server.o

x_client.o:	x_client.c x_client.h x_common.h
	cc -Wall -O2 -c x_client.c -o x_client.o

x_server:	x_server.o x_common.o
	cc -Wall x_server.o x_common.o -o x_server

x_client:	x_client.o x_common.o
	cc -Wall x_client.o x_common.o -o x_client
