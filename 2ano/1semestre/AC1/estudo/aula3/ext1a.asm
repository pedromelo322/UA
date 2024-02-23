		.data
		
		.eqv print_string,4
		.eqv print_int, 1
		.eqv read_int10, 5
		
str1:		.asciiz "introduza um  numero"
str2:		.asciiz "\nValor em código Gray: "
str3:		.asciiz "\nValor em binario: "

		.text
		.globl main
		

main:	
		li $t0, 0 	#gray = 0
		li $t1, 0	#bin = 0
		li $t2, 0	#mask = 0
		
		la $a0,str1
		li $v0,print_string
		syscall
		
		li $v0,read_int10
		syscall
		move $t0, $v0
		
		srl	$t2,$t0,1
		move $t1,$t0
		
while:	beq	$t2,$0,endwhile

		xor $t1,$t1,$t2
		
		srl	$t2,$t2,1

endwhile:

		la $a0, str2
		li $v0,print_string
		syscall
		move $a0, $t0
		li $v0, print_int
		syscall
		
		la $a0, str3
		li $v0,print_string
		syscall
		move $a0, $t1
		li $v0, print_int
		syscall
		
		