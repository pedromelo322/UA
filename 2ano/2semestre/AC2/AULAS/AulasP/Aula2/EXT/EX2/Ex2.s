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
		mfhi $t0
if3:	
		bne $t0,$0, endif3

		li $a0, '\n'
		li $v0, 3
		syscall


endif3:
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


		li $a1, 'a'
		jal timeDone
		
while2:		
		
		li $a0, 100
		li $a1, 0
		jal timeDone
		
		beq $v0, 0, while2
		
		addi $s3, $s3, 1


		j while
		
		
		
		li $v0, 0
		jr $ra



timeDone:



        move $t1, $a0   #ms
        move $t2, $a1   #reset


        li $t3,0    #curCount
        li $t4, 0   #retValue
        li $t5, 20000



if: 

        ble $t2, 0, else

        li $v0, resetCoreTimer
        syscall

        j endif



else:

        li $v0, readCoreTimer
        syscall

        move $t3, $v0

if2:
        
        mul $t0, $t5, $t1
        ble $t3, $t0, endif

        div $t3, $t5
        mflo $t4

endif:

        move $v0, $t4

        jr $ra