		.data
		
		.text
		.globl strlen

strlen:

		li $v0, 0					#int len = 0
		
		
while:	
		
		lb $t1, 0($a0)				#*s
		
		beq $t1, '\0',endwhile		#while(*s != '\0')
		addiu $a0, $a0, 1			#s++
		
		addi $v0, $v0, 1			# len += 1

		
		j while
		
endwhile:

		jr $ra
			
		
	
		