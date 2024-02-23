	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e: "
	.globl main
	.text
	.eqv print_str,4
	.eqv read_int, 5
	.eqv print_int, 1

main:
	li $t0, 0	#soma = 0
	li $t2, 0	#i = 0
	
	la $a0, str1		
	li $v0, print_str	#print string
	syscall
	
	li $v0, read_int	#read number
	syscall
	
	move $t1, $v0		#value = read number
	
	la $a0, str2
	li $v0, print_str
	syscall


#######################################	
for:
	bge $t2, 5, endfor	#while(i < 5)
	
	
	ble $t1, $0, else	#if(value > 0
	add $t0, $t0, $t1	#soma += value
	
	j endif
	
else:	
	la $a0, str2		#print str2
	li $v0, print_str
	syscall
	
	addi $t2, $t2, 1	#i++
	
	j for
	
	
	
endfor: 
	la $a0, str3		#print str3
	li $v0, print_str
	syscall
	
	move $a0, $t0
	li $v0, print_int		#print soma
	syscall
	jr $ra



endif:	
	addi $t2, $t2, 1		#i++
	j for
	
 
