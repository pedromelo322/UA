#	Mapa de registos
#	p:	$t0
#	*p:	$t1

	
			.data
			
array:		.space 21

			
			.eqv size,20
			.eqv print_string, 4
			.eqv read_string,  8
			.eqv print_char, 11
			
str:			.asciiz "Introduza uma string: "
			
			.text
			.globl main
			
main:		
			la	$t0, array
			
			la 	$a0, str
			li 	$v0,print_string
			syscall
			
			move $a0, $t0
			li $a1, size
			li $v0, read_string
			syscall
			
			move $t2, $t0
			
while:		
			lb $t1, 0($t0)
			
			beq $t1, '\0', endwhile
			
if:			

			blt $t1, 'a', endif
			bgt $t1,'z', endif
			
			addi $t1, $t1, -0x20
			
			sb $t1, 0($t0)
			
			
endif:
			
			addi $t0, $t0, 1
			
			j while
			
endwhile:


		la $a0, array
		li $v0, print_string
		syscall

		jr $ra
	

		
			
	
	
