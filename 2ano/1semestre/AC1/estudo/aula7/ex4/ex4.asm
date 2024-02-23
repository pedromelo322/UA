			.data
			
			
			
			.eqv printString, 4
			
			
str1:			.asciiz "Arquitetura de "
			.align 2
str2:			.space 50

nextline:		.asciiz "\n"
			.align 2

euquerojunto:	.asciiz"Computadores I"		
			
			.text
			.globl main
			
			
main:		

			addiu $sp, $sp, -8
			sw $ra, 0($sp)
			sw $s0, 4($sp)

			la $a0, str2
			la $a1, str1
			jal strcpy
			move $s0, $v0
			move $a0, $s0
			li $v0, printString
			syscall
			la $a0,nextline
			li $v0, printString
			syscall
			
			
			move $a0,  $s0
			la $a1, euquerojunto
			jal strcat
			move $a0, $v0
			li $v0, printString
			syscall
			
			li $v0, 0
			
			
			
			lw $ra, 0($sp)
			lw $s0, 4($sp)
			addiu $sp, $sp, 8
			
			jr $ra
			
			