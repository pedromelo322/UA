		.data
		
		.equ putChar, 3
		.equ printInt, 6
		.equ resetCoreTimer, 12
		.equ readCoreTimer, 11
		
		.text
		.globl main
		
		
		
main:


		li $t1, 0	# int counter = 0
		
		
		
while:

		li $a0, '\r'
		li $v0, putChar
		syscall		#putCHar('\r')
		
		
		move $a0, $t1
		li $a1, 10
		li $t0, 4
		sll $t0, $t0, 16
		or $a1, $a1, $t0
		li $v0, printInt
		syscall
		
		li $v0, resetCoreTimer
		syscall
		
while2:		
		
		li $v0, readCoreTimer
		syscall
		
		blt $v0, 200000, while2
		
		addi $t1, $t1, 1


		j while
		
		
		
		li $v0, 0
		jr $ra
