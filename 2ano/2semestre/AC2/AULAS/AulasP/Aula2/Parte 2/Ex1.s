        .data

        		
		.equ putChar, 3
		.equ printInt, 6
		.equ resetCoreTimer, 12
		.equ readCoreTimer, 11
		

msg:	.asciiz "Funciona"

        .text
        .globl main



main:

        li $s1, 0   #counter1
        li $s2, 0   #counter5
        li $s3, 0   #counter10



while:

		li $a0, '\r'
		li $v0, putChar
		syscall		#putCHar('\r')

				
		li $t0, 10
		move $t1, $s3
        div $t1, $t0
        mflo $a0
		li $a1, 4
		sll $a1, $a1, 16
		ori $a1, $a1, 10
		li $v0, printInt
		syscall



		li $a0, '\t'
		li $v0, putChar
		syscall		#putCHar('\t')
		
		li $t0, 2
		move $t1, $s3
        div $t1, $t0
        mflo $a0
		li $a1, 4
		sll $a1, $a1, 16
		ori $a1, $a1, 10
		li $v0, printInt
		syscall

		li $a0, '\t'
		li $v0, putChar
		syscall		#putCHar('\t')





		move $a0, $s3
		li $a1, 4
		sll $a1, $a1, 16
		ori $a1, $a1, 10
		li $v0, printInt
		syscall





		




		
		li $v0, resetCoreTimer
		syscall
		
while2:		
		
		li $v0, readCoreTimer
		syscall
		
		blt $v0, 2000000, while2
		
		addi $s3, $s3, 1


		j while
		
		
		
		li $v0, 0
		jr $ra