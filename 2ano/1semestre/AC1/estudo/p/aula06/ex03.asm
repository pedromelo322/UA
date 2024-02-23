	.data
	
str1: 	.asciiz "Array"
str2:	.asciiz "de"
str3: 	.asciiz "Ponteiros"
str4: 	.asciiz "\nString #"
str5:	.asciiz	": "

array: 	.word str1, str2, str3

	.eqv print_int10, 1
	.eqv print_str, 4
	.eqv print_char, 11
	.eqv SIZE, 3
	
	.text
	.globl main
	
######################################

main:
	li $t0, 0		#i = 0
	
for:	
	bge $t0, SIZE, endfor 	#for(i; i < size; i++)
	
	la $a0, str4
	li $v0, print_str	#print str4
	syscall
	
	move $a0, $t0		#print i
	li $v0, print_int10
	syscall
	
	la $a0, str5
	li $v0, print_str	#print str5
	syscall
	
	li $t1, 0		#j = 0
	
	
while:	

	la $t2, array		#&array
	
	sll $t3, $t0, 2		#$t3 = i * 4
	addu $t3, $t3, $t2	#&array[i]
	
	lw $t3, 0($t3)		#array[i][0]
	
	addu $t3, $t3, $t1	#&array[i][j]
	lb $t3, 0($t3)		#array[i][j]
	
	beq $t3, '\0', endWhile	#while(array[i][j] != "\0")
	
	move $a0, $t3
	li $v0, print_char	#print(array[i][j])
	syscall
	
	li $a0, '-'
	li $v0, print_char	#print("-")
	syscall
	
	addi $t1, $t1, 1	#j++
	
	j while
	
endWhile:
	addi $t0, $t0, 1	#i++

	j for
	
endfor: 
	jr $ra