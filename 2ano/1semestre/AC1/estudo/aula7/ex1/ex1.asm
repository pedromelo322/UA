
			.data
			
str:			.asciiz "Arquitetura de Computadores I"


			.eqv printInt,1
			
			.text
			
			.globl main
			
			
			
main:

			la $a0, str
			
			addiu  $sp, $sp, -4
			sw $ra, 0($sp)
			
			jal strlen
			
			move $a0, $v0
			li $v0, printInt
			syscall
			
			lw $ra, 0($sp)
			addiu  $sp, $sp, 4
			
			jr $ra
			
			


			