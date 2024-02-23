			.data
			
			
			
			.text
			.globl main
			
			
main:


			addi $sp, $sp, -4
			sw $ra, 0($sp)

			li $v0, 6					#read_float
			syscall
			
			mov.s $f12, $f0
			
			li $v0, 5					#read_int
			syscall
			
			move $a0, $v0
			
			jal xtoy
			
			mov.s $f12, $f0
			li $v0, 2
			syscall
			
			
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			jr $ra
			
			