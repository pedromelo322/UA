	.data
	
str1: 	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"

array:	.word str1, str2, str3

	.eqv print_str, 4
	.eqv SIZE, 3
	
	.text
	.globl main
	
#######################################

main:

	la $t0, array 		#p = array
	li $t1, SIZE		#$t1 = size
	sll $t1, $t1, 2		#$t1 = size * 4
	
	addu $t1, $t0, $t1	#pultimo = size * 4 + array
	
for:	
	bge $t0, $t1, endfor	#for(p; p < pultimo; p++)
	
	lw $a0, 0($t0)		#array[p]
	li $v0, print_str
	syscall
	
	addi $t0, $t0, 4	#p++
	
	j for
	
endfor:
	jr $ra
