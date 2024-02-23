

			.data
			
			.text
			.globl strrev
			
			
strrev:

			addiu $sp, $sp, -16
			sw $ra, 0($sp)
			sw $s0, 4($sp)
			sw $s1, 8($sp)
			sw $s2, 12($sp)

			move $s2,  $a0
			move  $s0, $a0
			move  $s1, $a0
			
while:		
			lb $t0,0($s1)
			beq $t0, '\0', endwhile
			
			addiu $s1, $s1, 1	
			j while
endwhile:
			addiu $s1, $s1, -1
			

			
while2:
			bge $s0, $s1, endwhile2
			
			move $a0, $s0
			move $a1, $s1
			
			jal exchange
			
			addiu $s0, $s0 , 1
			addiu $s1, $s1, -1
			
			j while2
			
endwhile2:

			move $v0, $s2

			lw $ra, 0($sp)
			lw $s0, 4($sp)
			lw $s1, 8($sp)
			sw $s2, 12($sp)
			addiu $sp, $sp, 16
			
			jr $ra
			
