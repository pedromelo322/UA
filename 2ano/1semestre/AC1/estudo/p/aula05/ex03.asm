	.data
	.eqv SIZE, 5
	
list: 	.space 20

str1: 	.asciiz "\nIntroduza um numero: "

str2: 	.asciiz "\nConteudo do array ordenado:\n"

str3:	.asciiz "; "
	

	.eqv print_str, 4
	.eqv read_int, 5
	.eqv print_int, 1
	.eqv TRUE, 1
	.eqv FALSE, 0
	
	.text
	.globl main
	
############################################

main:
	li $t1, 0	#i = 0
	li $t3, 0 	#aux = 0
	
for: 	
	
	bge $t1, SIZE, endfor	#for (i; i < size; i++)
	
	la $a0, str1
	li $v0, print_str	#print str1
	syscall
	
	la $t2, list	#$t2 = list
	
	li $v0, read_int	#read int
	syscall
	
	sll $t4, $t1, 2	#$t4 = i * 4
	
	addu $t4, $t4, $t2 #$t4 = list + i * 4
	
	sw $v0, 0($t4)	#list[i] = int
		
	addi $t1 ,$t1, 1	#i++
	
	j for
	
endfor:
	li $t1, 0	#i = 0
	li $t7, SIZE	#$t7 = size
	addiu $t7, $t7, -1 	#$t7 = size - 1
	
	j do

###########################################

do:	
	li $t0, 0	#houveTroca = 0
	li $t1, 0	#i = 0

for2:	
	bge $t1, $t7, endfor2	#for (i; i < size -1; i++)
	
	sll $t4, $t1, 2		#$t4 = i * 4
	addu $t4, $t4, $t2	#&list
	
	lw $t5, 0($t4)		#list[i]
	lw $t6, 4($t4)		#list[i+1]
	
if:	ble $t5, $t6, endif	#if (list[i] > list[i+1])
	
	move $t3, $t5		#aux = list[i]
	sw $t6, 0($t4)		#list[i] = list[i+1]
	sw $t3, 4($t4)		#list[i+1] = aux
	
	li $t0, TRUE		#houveTroca = TRUE
	
endif:
	addi $t1, $t1, 1	#i++
	
	j for2
	
	
endfor2:

	bne $t0, TRUE, endwhile
	
	j do
	
endwhile:

	la $a0, str2
	li $v0, print_str
	syscall
	
	li $t1, 0	#i = 0
	
	
for3:	
	#printar lista
	
	bgeu $t1, SIZE, endfor3	#for (i; i < size; i++)
	
	
	sll $t4, $t1, 2		#$t4 = i * 4
	
	addu $t4, $t4, $t2	#&list[i]
	
	lw $t5, 0($t4)		#list[i]
	
	move $a0, $t5
	li $v0, print_int	#print int
	syscall
	
	la $a0, str3
	li $v0, print_str	#print str
	syscall
	
	addi $t1, $t1, 1	#i++
	
	j for3
	

endfor3:
	jr $ra
	
	
	
	
	

	
	
	
	


	
