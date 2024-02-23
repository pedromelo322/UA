		.data
		
		.eqv print_string, 4
		.eqv read_int10, 5
		.eqv print_int10, 1
		
str1:		.asciiz "Introduza um numero: "
str2:		.asciiz "\nO valor em binário e': "
char1:	.asciiz "1"
char0:	.asciiz "0"
char_space:	.asciiz " "

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
		li $t6, 0			#flag = 0
		
for:		
		bge $t1,32,endfor
		
		li $t3, 0x80000000 
		
		and   $t2, $t0, $t3

		srl $t5, $t2, 31
		
		beq $t6,1,action
		bne $t5,0,action
		
		j endaction

action:	
		
		rem $t4, $t1,4 # $t4 = i % 4
		
		beq $t4,$0,space		
	
		j endspace
		
		
space:	la $a0, char_space
		li $v0, print_string
		syscall
		
endspace: 			
		li $t6, 1
		move $a0, $t5
		li $v0, print_int10
		syscall
		
endaction:
		
		sll $t0,$t0,1
		addi $t1, $t1,1
		j for
		
		
endfor:

		jr $ra