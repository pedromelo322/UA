
			.data
			
			
str:			.asciiz "ITED -orievA ed edadisrevinU"


			.eqv printString, 4
			
			.text
			.globl main
			
			
main:		

			
			la $a0, str
			
			jal strrev
			
			move $a0, $v0
			li $v0, printString
			syscall
			
			li $v0, 0
			jr $ra