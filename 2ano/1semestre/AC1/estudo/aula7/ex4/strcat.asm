			.data
			
			.text
			.globl strcat
			
			
			
strcat:		


			addiu $sp, $sp, -8
			sw $ra, 0($sp)
			sw $s0,4($sp)
			
			
while:		
			lw $t0, 0($a0)
			beq $t0, '\0', endwhile

			addiu $a0, $a0, 1

endwhile:

			move $a0, $s0
			jal strcpy
						
			lw $ra, 0($sp)
			lw $s0,4($sp)
			addiu $sp, $sp, 8
			
			move $a0, $s0
			
			move $v0, $s0
			
			jr $ra
		
			
			
		