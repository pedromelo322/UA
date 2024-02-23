#	Mapa de registos
#	p: 		$t0
#	*p:		$t1
#	*pultimo:	$t2
#	soma:	$t3

		.data
		
array:	.word	7692, 23, 5, 234			#	int array[4] = {7692, 23, 5, 234}
		.eqv		print_int10, 1
		.eqv		size, 4
		
		.text
		.globl main
		
main:	
		li $t3, 0							#	soma = 0
		
		la $t0, array						#	p = &(array[0]) 
		
		li $t4, size
		
		addi $t4, $t4, -1 					# 	temp = size - 1
		
		sll $t4, $t4, 2						# 	temp = temp x 4
		
		addu $t2, $t4, $t0					# 	pultimo = temp + &(array[0]) 
		

while:	
		
		bgtu $t0,$t2,endwhile

		lw $t1, 0($t0)						#	*p 

		add $t3,  $t3 , $t1					# 	soma = soma + (*p)
		
		addiu $t0, $t0, 4
		
		j while
		
endwhile:

		move $a0, $t3
		li $v0, print_int10
		syscall
		
		
		jr $ra
		
