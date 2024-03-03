	.equ getChar,2
	.equ putChar,3
	.equ printInt,6
	

	.data
	
	.text
	.globl main
	
	
main:

	li $t1, 0	#char c;
	li $t2, 0	#int cnt = 0;	

	



do:

	li $v0, getChar	
	syscall		#c = getChar();
	move $t1, $v0
	
	
	move $a0, $t1
	li $v0, putChar
	syscall		#putChar(c);
	
	addi $t2, $t2, 1 #cnt++;
	
	
while:	

	bne $t1, '\n', do	#while(c != '\n')
	move $a0, $t2
	li $a1, 10
	li $v0, printInt	
	syscall			#printInt(cnt ,10);
	
	li $v0, 0		#return 0
	
	jr $ra
	 
