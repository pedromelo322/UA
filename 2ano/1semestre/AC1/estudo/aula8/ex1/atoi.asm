			.data
			
			
			.text
			.globl atoi
			
			
			
atoi:
			li $v0, 0	
			
while:		
			lb $t1, 0($a0)
			blt $t1,'0',endwhile
			bgt $t1,'9',endwhile
			
			addi $t2,$t1,-0x30

			mulu $v0, $v0,10
			add $v0, $v0, $t2
			
			addi $a0, $a0, 1

			j while
endwhile:
			
			jr $ra