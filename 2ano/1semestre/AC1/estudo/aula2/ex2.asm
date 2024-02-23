#guardar em $t2, $t3, $t4
#valor em $t0
#deslocamento $t1

		.data
		.eqv print_int, 1
		.eqv read_int, 5
		.eqv print_string, 4

str1: 	.asciiz "valor"
str3:		.asciiz "\n"
		
		.text
		.globl main
		
main:	la $a0, str1
		ori $v0, $0, print_string
		syscall
		ori $v0, $0, read_int
		syscall
		or $t0, $0, $v0
		
		
		sll $t2,$t0, 1
		or $a0,$0,$t2
		ori $v0,$0,print_int
		syscall
		
		la $a0, str3
		ori $v0, $0, print_string
		syscall

	
		srl $t3,$t0, 1
		or $a0,$0,$t3
		ori $v0,$0,print_int
		syscall
		
		la $a0, str3
		ori $v0, $0, print_string
		syscall

		
		sra $t4,$t0, 1
		or $a0,$0,$t4
		ori $v0,$0,print_int
		syscall
		
		jr $ra
		
		
		