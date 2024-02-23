        .data

        .equ inKey, 1
		.equ putChar, 3
		.equ printInt, 6
		.equ resetCoreTimer, 12
		.equ readCoreTimer, 11


        .text
        .globl main



main:
		li $s1, 2000000 #Tempo base
		li $s2, 0	#tempo corrente
        li $s3, 0   #counter10
		li $s4, 0xFFFFFFFF	#flag = 1

		move $s2, $s1



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

		li $v0, inKey
		syscall

if:		bne $v0, 'a', elif

		li $t0, 2
		move $t1, $s2
		div $t1, $t0
		mflo $s2


		j endif

elif:
		bne $v0, 'n', elif2

		move $s2, $s1

		j endif

elif2:

		bne $v0, 's', elif3

while3:

		li $v0, inKey
		syscall

		bne $v0, 's', while3

endwhile3:

		li $v0, resetCoreTimer
		syscall

		j endif


elif3:

		bne $v0, 'r', endif

		li $s3, 0


endif:	
	

		
		li $v0, readCoreTimer
		syscall
		

		blt $v0, $s2, while2
		
		addi $s3, $s3, 1


		j while
		
		
		
		li $v0, 0
		jr $ra