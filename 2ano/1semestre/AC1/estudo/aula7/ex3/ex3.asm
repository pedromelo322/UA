

			.data
			
			.eqv STR_MAX_SIZE,30
			.eqv printString , 4
			.eqv printInt, 1
			
			
			
nextline:		.asciiz "\n"				
longa:		.asciiz "String too long: "
str1:			.asciiz "I serodatupmoC ed arutetiuqrA"
			.align 2
str2:			.space 31

					
			.text
			.globl main
				
			
main:

			addiu $sp, $sp, -4
			sw $ra, 0($sp)

			la $s1, str1
			la $s2, str2
			li $s3, 0
			
			
			move $a0, $s1
			jal strlen
if:
			bgt $v0, STR_MAX_SIZE, else
			
			move $a0, $s2
			move $a1, $s1
			
			jal strcpy
			
			move $a0, $v0
			li $v0, printString
			syscall
			
			la $a0,nextline
			li $v0, printString
			syscall
			
			move $a0, $s2
			jal strrev
			
			move $a0, $v0
			li $v0, printString
			syscall
			
			li $s3, 0
			
			j endif
			

else:
			la $a0, longa
			li $v0, printString
			syscall
			
			
			move $a0, $s1
			jal strlen
			
			move $a0, $v0
			li $v0, printInt
			syscall
			
			li $s3, -1
			
			
			
endif:

			lw $ra, 0($sp)
			addiu $sp, $sp, 4

			move $v0, $s3
			jr $ra
			