.data
		
		.equ putChar, 3
		.equ printInt, 6
		.equ resetCoreTimer, 12
		.equ readCoreTimer, 11
		
		.text
		.globl main
		
		
		
main:



		addi $sp, $sp, -4
		sw $ra, 0($sp)


		li $s1, 0	# int counter = 0
		
		
		
while:

		li $a0, '\r'
		li $v0, putChar
		syscall		#putCHar('\r')
		
		
		move $a0, $s1
		li $a1, 4
		sll $a1, $a1, 16
		ori $a1, $a1, 10
		li $v0, printInt
		syscall
		
		li $v0, resetCoreTimer
		syscall
		
		jal delay
		
		addi $s1, $s1, 1


		j while
		
		
				
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		
		li $v0, 0
		jr $ra
		
		
		
delay:

		li $v0, resetCoreTimer
		syscall
	

while2:

		li $v0, readCoreTimer
		syscall
		
		blt $v0, 20000, while2
		
		
		jr $ra
		
