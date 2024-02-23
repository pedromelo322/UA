		.data
		
		.eqv print_string, 4
		.eqv print_int10, 1
		.eqv read_int10, 5
		
str1:		.asciiz "Introduza dois numeros: "
str2:		.asciiz "Resultado:	"

		.text
		.globl main
		
main:	li $t0,0	# res = 0
		li $t1,0	# i = 0
		li $t2,0 	#mdor
		li $t3,0	#mdo
		
		la $a0, str1
		li $v0, print_string
		syscall
		
		li $v0,read_int10
		syscall
		andi $t2, $v0, 0xFFFF
		
		li $v0,read_int10
		syscall
		andi $t3, $v0,  0xFFFF
		
while:	beq $t2,0,endwhile
		bge	$t1,4,endwhile
		andi $t4,$t2, 0x0001
		
if:		beq $t4,0,endif
		add $t0,$t0,$t3
		
		
endif:	
		sll $t3, $t3, 1
		srl $t2, $t2, 1
		
		addi $t1, $t1, 1
		
		j while
		
endwhile:
		
		la $a0, str2
		li $v0, print_string
		syscall
		
		move $a0, $t0
		li $v0, print_int10
		syscall
		
		jr $ra
		
		