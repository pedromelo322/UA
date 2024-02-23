	# i: $t0 
	# lista: $t1 
	# lista + i: $t2
	
	.data
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv SIZE, 5
	
str: 	.asciiz "\nIntroduza um número: "
	.align 2

list: 	.space 20

	.text
	.globl main
	

################################################

main: 	
	li $t0, 0	#i = 0
	
	
for: 	bge $t0, SIZE, endfor	#for (i; i < size; i++)

	la $a0, str		#print str
	li $v0, print_str
	syscall
	
	li $v0, read_int	#read int
	syscall
	
	la $t1, list		#$t1 = list
	
	sll $t2, $t0, 2		#$t2 = i * 4
	
	addu $t2, $t2, $t1	#list[i]
	
	sw $v0, 0($t2)		#list[i] = int
	
	addi $t0, $t0, 1	#i++
	
	j for
	
endfor:
	li $v0, 0
	jr $ra
