			.data
			
			.text
			.globl strcpy
			
			
			
strcpy:
			move $t3, $a0
			

doWhile:		
			
			lb $t1, 0($a1)
			sb $t1, 0($a0)
			
			addiu $a0, $a0, 1
			addiu $a1, $a1, 1
			bne $t1, '\0', doWhile
			
			move $v0, $t3
			
			jr $ra
			
			
			

			