	.data

str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "Ponteiros"

array:	.word str1, str2, str3

	.eqv print_str, 4
	.eqv SIZE, 3
	
	.text
	.globl main
	
####################################3

main:
	li $t0, 0	#i = 0
	
for:	
	bge $t0, SIZE, endfor	#for(i; i < size; i++)
	
	sll $t1, $t0, 2	#$t1 = i * 4
	
	la $t2, array	#array
		
	add $t2, $t2, $t1 	#&array[i]
	
	lw $a0, 0($t2)	#array[i]
	li $v0, print_str	#print_str
	syscall
	
	addi $t0, $t0, 1	#i++
	
	j for
	
endfor:

	jr $ra