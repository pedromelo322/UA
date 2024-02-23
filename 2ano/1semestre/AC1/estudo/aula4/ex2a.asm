		
		.data
		
array:	.space 21
		
		.eqv size,20
		.eqv read_string, 8
		.eqv print_int10, 1
		
		
		.text
		.globl main
		
main:	
		li $t0, 0				#	i = 0
		li $t1, 0				# 	num = 0
		
		
		la $t2, array		
		
		move $a0, $t2
		li $a1, size
		li $v0, read_string		#	read_string($a0, $a1)
		syscall
		
while:	
		lb $t3, 0($t2)
		beq	$t3,'\0',endwhile
		
if:		
		blt	$t3,'0',endif
		bgt	$t3,'9',endif
		
		addi $t1,$t1,1
				
endif:
		addi $t2,$t2,1	
		
		j while
					
endwhile:

		move $a0,$t1
		li $v0, print_int10
		syscall 		
		
		jr $ra

		
		
		
		
