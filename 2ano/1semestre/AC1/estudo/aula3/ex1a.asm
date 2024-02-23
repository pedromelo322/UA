
		.data
		.eqv print_string, 4
		.eqv print_int10, 1
		.eqv read_int10, 5

str1:		.asciiz "Introduza um numero: "
str2:		.asciiz "Valor ignorado\n"
str3:		.asciiz "A soma dos positivos e': "

		.text
		.globl main
		
main: 
		ori $t0,$0,0 #i = 0
		ori $t1,$0,0 #soma = 0
		
for:		
		bge $t0, 5, endfor
		la $a0, str1
		ori $v0,$0,print_string
		syscall
		
		ori $v0, $0,read_int10
		syscall
		
		bltz $v0, else
		add $t1, $t1,$v0
		
		j endif
	
else:	
		la $a0, str2
		ori $v0, $0, print_string

endif:

		addi $t0, $t0, 1
		j for
		
endfor:	
		
		
		la $a0, str3
		ori $v0, $0, print_string
		syscall
		
		or $a0, $0, $t1
		ori $v0, $0, print_int10
		syscall
		
		
		jr $ra