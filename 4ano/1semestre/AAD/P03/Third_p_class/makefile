#
# makefile for the practical class AAD_P03
#

clean:
	rm -f a.out create_and_join create_and_join.s lock_and_unlock reduction

create_and_join:	create_and_join.c
	cc -Wall -O2 -fopenmp create_and_join.c -o create_and_join

create_and_join.s:	create_and_join.c
	cc -Wall -O2 -S -fverbose-asm -fopenmp create_and_join.c

lock_and_unlock:	lock_and_unlock.c
	cc -Wall -O2 -fopenmp lock_and_unlock.c -o lock_and_unlock

reduction:		reduction.c
	cc -Wall -O2 -fopenmp reduction.c -o reduction

