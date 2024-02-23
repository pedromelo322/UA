			.data
			
			.eqv MAX_STR_SIZE,33
		
str:			.space 34
			
			.text
			.globl main
			
			
			
main:		

			addi $sp, $sp, -12
			sw $ra, 0($sp)
			sw $s0, 4($sp)
			sw $s1, 8($sp)

do:			

			li $v0, 5
			syscall
			
			move $s0, $v0
			la $s1, str
			
			move $a0, $s0
			li $a1, 2
			move $a2, $s1
			jal itoa
			
			move $a0, $v0
			li $v0, 4
			syscall
			
			move $a0, $s0
			li $a1, 8
			move $a2, $s1
			jal itoa
			
			move $a0, $v0
			li $v0, 4
			syscall
			
			move $a0, $s0
			li $a1, 16
			move $a2, $s1
			jal itoa
			
			move $a0, $v0
			li $v0, 4
			syscall
			

		

while:		bne $s0, 0, do

			li $v0, 0
			
						
			lw $ra, 0($sp)
			lw $s0, 4($sp)
			lw $s1, 8($sp)
			addi $sp, $sp, 12
			
			jr $ra

			