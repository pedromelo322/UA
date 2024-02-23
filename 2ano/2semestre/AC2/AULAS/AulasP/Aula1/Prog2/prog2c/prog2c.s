	.equ printStr, 8
	.equ readInt10, 5
	.equ printInt, 6
	.equ printInt10, 7
	
	.data
	
str1:	.asciiz "\nIntroduza um inteiro (sinal e módulo): "
str2:	.asciiz "\nValor em base 10 (signed): "
str3:	.asciiz "\nValor em base 2: "
str4:	.asciiz "\nValor em base 16: "
str5:	.asciiz "\nValor em base 10 (unsigned): "
str6:	.asciiz "\nValor em base 10 (unsigned), formatado: "

	.text
	.globl main
	
	
main:

	li $t1, 0	# int value
	
while:
	
	la $a0, str1
	li $v0, printStr
	syscall
	
	li $v0, readInt10
	syscall
	
	move $t1, $v0
	
	la $a0, str2
	li $v0, printStr
	syscall
	
	move $a0, $t1
	li $v0, printInt10
	syscall
	
	la $a0, str3
	li $v0, printStr
	syscall
	
	move $a0, $t1
	li $a1, 2
	li $v0, printInt
	syscall
	
	la $a0, str4
	li $v0, printStr
	syscall
	
	move $a0, $t1
	li $a1, 16
	li $v0, printInt
	syscall
	
	la $a0, str5
	li $v0, printStr
	syscall
	
	move $a0, $t1
	li $a1, 10
	li $v0, printInt
	syscall
	
	la $a0, str6
	li $v0, printStr
	syscall
	
	move $a0, $t1
	li $a1, 10
	li $t0, 5
	sll $t0, $t0, 16
	or $a1, $a1, $t0
	li $v0, printInt
	syscall
	





	j while
	
	
	
	jr $ra
