		.data
		
		.equ resetCoreTimer, 12
		.equ readCoreTimer, 11
		
		.text
		.globl delay
		
		
		
delay:

		li $v0, resetCoreTimer
		syscall
	

while:

		li $v0, readCoreTimer
		syscall
		
		blt $v0, 20000, while
		
		
		jr $ra
		
