#	Mapa de registos
#	$t0:	p
#	$t1:	*p

		.data
		.eqv size, 10
		.eqv print_int10, 1
		.eqv print_string, 4

array:	.word 8,-4,3,5,124,-15,87,9,27,15

str:		.asciiz "; "

		.text
		.globl main
		
main:	
		la $t0, array			#	p = lista 
		li $t2, size
		sll $t2, $t2, 2
		addu $t2, $t0, $t2
		
for:		bge $t0, $t2, endfor

		lb $t1,0($t0)
		move $a0, $t1
		li $v0, print_int10
		syscall
		
		la $a0, str
		li $v0, print_string
		syscall

		addi $t0,$t0,4
		j for
		
endfor:	
		li $v0,0
		jr $ra