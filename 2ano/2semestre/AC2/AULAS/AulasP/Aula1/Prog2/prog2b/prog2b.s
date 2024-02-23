		
		.equ inKey, 1
		.equ putChar, 3
		.equ printInt, 6
		
		
		.data
		
		
ponto: 		.byte '.'
		
		.text
		.globl main
		
		
		
main:
		li $t1, 0  # int c;
		li $t2, 0  # int cnt = 0;
		
		
do:

		li $v0, inKey
		syscall		
		
		move $t1, $v0  # c = inkey();
		

if:	
		
		beq $t1,0,else	# if ( c != 0)
		
		move $a0, $t1
		li $v0, putChar
		syscall		# putChar(c);
		
		j endif
		
		
else:

		la $a0, ponto 
		lb $a0, 0($a0)
		li $v0, putChar
		syscall		# putChar('.');
		
		
endif:

		addi $t2,$t2,1  # cnt++;
		
		
while:

		bne $t1, '\n', do #while( c!= '\n');
				  
		move $a0, $t2     
		li $a1, 10
		li $v0, printInt
		syscall		  #printInt(cnt, 10);
		
		li $v0,0 	  
		jr $ra		  #return 0

		
		
		
