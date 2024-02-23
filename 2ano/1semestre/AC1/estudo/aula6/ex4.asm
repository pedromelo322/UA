			.data
			
			
			
			.eqv printString, 4
			.eqv printInt, 1
			
		
		
msg1:		.asciiz "Nr. de parametros: "

msg2:		.asciiz "\nP"

	
msg3:		.asciiz ": "	
			
			.text
			.globl main
			
			
main:

		move $t0, $a0
		move $t1, $a1
		
		la $a0, msg1
		li $v0, printString
		syscall
		
		move $a0, $t0
		li $v0, printInt
		syscall
		
		
		li $t2,0
		
for:
		bge $t2,$t0,endfor
		
		la $a0, msg2
		li $v0, printString
		syscall
		
		move $a0, $t2
		li $v0, printInt
		syscall
		
		la $a0, msg3
		li $v0, printString
		syscall
		
		sll $t3, $t2, 2 
		addu $a0, $t1, $t3
		lw $a0,0($a0)
		
		li $v0, printString
		syscall
		

		addi $t2, $t2, 1
		j for
endfor:
		
		jr $ra