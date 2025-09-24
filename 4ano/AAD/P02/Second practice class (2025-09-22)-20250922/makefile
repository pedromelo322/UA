#
# makefile for the practical class AAD_P01
#

clean:
	rm -f a.out create_and_join lock_and_unlock producer_consumer

create_and_join:	create_and_join.c
	cc -Wall -O2 -pthread create_and_join.c -o create_and_join

lock_and_unlock:	lock_and_unlock.c
	cc -Wall -O2 -pthread lock_and_unlock.c -o lock_and_unlock

producer_consumer:	producer_consumer.c
	cc -Wall -O2 -pthread producer_consumer.c -o producer_consumer
