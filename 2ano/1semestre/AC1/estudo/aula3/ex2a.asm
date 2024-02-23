		.data
		
		.eqv print_string, 4
		.eqv read_int10, 5
		.eqv print_int10, 1
		
str1:		.asciiz "Introduza um numero: "
str2:		.asciiz "\nO valor em binário e': "
char1:	.asciiz "1"
char0:	.asciiz "0"

		.text
		.globl main
		
main:	
		la $a0, str1
		li $v0, print_string
		syscall
		
		li $v0, read_int10
		syscall
		move $t0, $v0 	#$t0 = numero
		
		la $a0, str2
		li $v0, print_string
		syscall
		
		li $t1, 0			#$t1 = i = 0
		
for:		
		bge $t1,32,endfor
		
		li $t3, 0x80000000 
		
		and   $t2, $t0, $t3
					
		
if:		beq $t2,$0,else
		
		la $a0, char1
		li $v0, print_string
		syscall
			
		j endif
		
else:		
		la $a0, char0
		li $v0, print_string
		syscall
		
endif:	
		sll $t0,$t0,1
		addi $t1, $t1,1
		j for
		
		
endfor:

		jr $ra