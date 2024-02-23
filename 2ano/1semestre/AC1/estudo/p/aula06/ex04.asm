	.data
	
str1:	.asciiz "Nr parametros: "

	.eqv print_str, 4
	.text
	.globl main
	
######################################

main:
	move $t1, $a0		#argc
				
	move $t2, $a1		#argv
	
	la $t0, str1
	li $v0, print_str	#print str1
	syscall
	
	
	
	
	
	
