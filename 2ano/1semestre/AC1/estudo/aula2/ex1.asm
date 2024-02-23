# valores no $t0 e $t1
# AND, OR, NOR e XOR, os resultados devem ser armazenados nos registos $t2, $t3, $t4 e $t5, respetivamente.

		.data
str1: 	.asciiz "Insira 2 numeros/n"
		.eqv read_int, 5
		.eqv print_int, 1
		.eqv print_string, 4
		
		.text
		.globl main
	
	
main:	la $a0, str1
		ori $v0, $0, print_string
		syscall 
		
		ori $v0, $0, read_int
		syscall
		or $t0, $0, $v0
		ori $v0, $0, read_int
		syscall
		or $t1, $0, $v0
		
		and 	$t2, $t0, $t1
		or   	$t3, $t0, $t1
		nor	$t4, $t0, $t1
		xor 	$t5, $t0, $t1
		
		or $a0, $0, $t2
		ori $v0, $0,print_int
		syscall
		or $a0, $0, $t3
		ori $v0, $0,print_int
		syscall
		or $a0, $0, $t4
		ori $v0, $0,print_int
		syscall
		or $a0, $0, $t5
		ori $v0, $0,print_int
		syscall
		
		jr $ra