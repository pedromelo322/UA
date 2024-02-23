	.data 
str1:   .asciiz "\nIntroduza um numero: "
str2:	.asciiz "\nO valor em binario e:"
str3:	.asciiz " "
	.globl main
	.text
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv print_int, 1
	
main:	
	li $t0, 0		#valor = 0
	li $t1, 0		#bit = 0
	li $t2, 0		#i = 0
	li $t3, 0x80000000	

	
	
	la $a0, str1		#print string
	li $v0, print_str
	syscall
	
	li $v0, read_int	#ler valor
	syscall
	
	move $t0, $v0		#valor = valor introduzido
	
	xori $t0, $t0, 0xFF	#valor = not valor
	addi $t0, $t0, 1	#valor in unsigned
	
	la $a0, str2
	li $v0, print_str
	syscall

#################################
for: 
	bge $t2, 32, endfor	#for (i < 32)
	
	rem $t4, $t2, 4		#res = i % 4
	
	beq $t4, $0, space	#if((i % 4) == 0)
	
contFor:
	and $t1, $t0, $t3 	#bit = value & 0x80000000
	
	srl $t1, $t1, 31	#bit = value >> 31
	
	
	
	

	move $a0, $t1		#print binario
	li $v0, print_int
	syscall
	
	
	
	beq $t1, 0, else	#if(bit != 0)
	
	#li $a0, 1
	#li $v0, print_int	#print 1
	#syscall
	
	j endif

####################################
else:
	#li $a0, 0		#print 0
	#li $v0, print_int
	#syscall
	
	j endif
	
###################################

endif:	
	sll $t0, $t0, 1		#value = value << 1
	addi $t2, $t2, 1	#i++
	j for			#voltar ao for


####################################	
	
endfor: 
	jr $ra
	
####################################
space:
	la $a0, str3
	li $v0, print_str	#print espaço
	syscall
	
	j contFor
	
















