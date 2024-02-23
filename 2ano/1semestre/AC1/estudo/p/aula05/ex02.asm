	.data

list: 	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

str: 	.asciiz "\nConteudo do array:\n"

str2: 	.asciiz "; "

	.eqv print_str, 4
	.eqv print_int10, 1
	.eqv SIZE, 10
	
	.text
	.globl main

#######################################

main: 	
	
	la $t0, list	#p = list
	
	li $t2, SIZE	#$t2 = SIZE
	
	sll $t2, $t2, 2		#$t2 = SIZE * 4
	
	addu $t2, $t0, $t2	#t2 = list + SIZE
	
	la $a0, str
	li $v0, print_str	#print str
	syscall
	
	
for: 	
	bgeu $t0, $t2, endfor	#for (p; p < list + SIZE; p++)
	
	lw $t1, 0($t0)	#*p = p
	
	move $a0, $t1
	li $v0, print_int10	#print int
	syscall
	
	la $a0, str2
	li $v0, print_str	#print str
	syscall
	
	addiu $t0, $t0, 4	#p++
	
	j for
	
endfor:
	jr $ra
	
	
	