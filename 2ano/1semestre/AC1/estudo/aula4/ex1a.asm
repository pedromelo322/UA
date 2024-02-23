		.data
	
	
array:	.space 21

		.eqv size, 20
		.eqv read_string, 8
		.eqv print_int10, 1
	
		.text
		.globl main
	
main: 
		li $t0, 0				#	num = 0
		li $t1, 0				#	i = 0
		
		la $t2, array			#	$t2 =  &(array[0])
		move $a0, $t2		
		li $a1, size
		li $v0, read_string		#	read_string($a0, $a1)
		syscall
		
		
while: 	
		add $t3, $t2, $t1
		
		lb $t4, 0($t3)
		
		beq $t4, '\0', endwhile	#	while( str[i] != '\0')
		
if:				

		blt $t4, '0',endif
		bgt $t4,'9',endif
		
		addi $t0, $t0,1
		
endif:
		
		addi $t1, $t1, 1		#	i++
		j while
		
endwhile:
		
		move $a0,$t0
		li $v0, print_int10
		syscall

		
		jr $ra
