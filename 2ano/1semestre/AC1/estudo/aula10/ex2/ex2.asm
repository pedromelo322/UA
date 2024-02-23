				.data
				
				
				
num:			.double 5.9
				
				.text
				.globl main
				
				
				
main:
			addi $sp, $sp, -4
			sw $ra, 0 ($sp)

			la $t0, num
			l.d $f12, 0($t0)
			
			jal sqrt
	
			mov.d $f12, $f0
			li $v0, 3
			syscall
			
						
			lw $ra, 0 ($sp)
			addi $sp, $sp, 4
			
			jr $ra

				