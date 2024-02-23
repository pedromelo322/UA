	.data 
	
	.eqv print_int10, 1
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv SIZE, 5
	
array: .space 20

str1: 	.asciiz "\nIntroduza um numero: "

str2: 	.asciiz "\nConteudo do array ordenado:\n"

str3: 	.asciiz "; "

	.text
	.globl main
	
##################################################

main:
	
	la $t0, array	#p = array	
	li $t1, SIZE	#$t1 = SIZE
	addi $t1, $t1, -1	#$t1 = SIZE - 1
	
	sll $t1,$t1, 2	#$t1 = (SIZE - 1) * 4
	
	addu $t1, $t0, $t1	#pUltimo = array + SIZE
	
for:	
	bgtu $t0, $t1, do		#for (p; p <= pUltimo; p++)
	
	la $a0, str1
	li $v0, print_str	#print str
	syscall
	
	li $v0, read_int	#read int
	syscall	
	
	sw $v0 , 0($t0)		#*p = int
	
	addi $t0, $t0, 4	#p += 4
	
	j for
	

do:	
	la $t0, array	#p = array
	li $t2, FALSE	#houveTroca = FALSE
	
for2:	
	bgeu $t0, $t1, endfor2	#for (p; p < pUltimo; p++)
	
	lw $t3, 0($t0)		#*p
	lw $t4, 4($t0)		#*(p+1)

	
if:	
	bleu $t3, $t4, endif	#if (*p > *(p+1))
	
	move $t5, $t3		#aux = *p
	
	sw $t4, 0($t0)		#*p = *(p+1)
	sw $t5, 4($t0)		#*(p+1) = aux
	
	li $t2, TRUE		#houveTroca = True
	
	
endif:
	addi $t0, $t0, 4	#p += 4
	
	j for2
	
endfor2:

	bne $t2, TRUE, endWhile 	#while (houveTroca == TRUE)
	
	j do
	

endWhile:

	la $t0, array	#p = array
	
	la $a0, str2
	li $v0, print_str		#print str
	syscall			
	
for3:
	bgtu $t0, $t1, endfor3		#for(p; p < array + size; p++)
	
	lw $t3, 0($t0)	#*p
	
	move $a0, $t3
	li $v0, print_int10		#print int
	syscall
	
	la $a0, str3
	li $v0, print_str		#print str
	syscall
	
	addi $t0, $t0, 4		#p+= 4
	
	j for3
	
	
endfor3:
	jr $ra
	
	
	
