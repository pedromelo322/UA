			.data
			
			
			
			.eqv printString, 4
			.eqv printInt, 1
			.eqv printChar, 11
			
msg1:		.asciiz "número de caracteres: "


msg2:		.asciiz "número de letras: "


msg3:		.asciiz "a string com o maior número de caracteres: "
			
pontos:		.asciiz "-> "		

nextline:		.asciiz "\n"

traco:		.asciiz "-"

pontovirgula:	.asciiz "; "


			.text
			.globl main
			
			
			

			
			
main:
		
		move $t0, $a0
		move $t1, $a1
		
			
		li $t2, 0							#$t2 = i
		li $t3,0 							#$t3 = argv[i]
		
		
		li $t8,0							#gurda o argv maior
		li $t9,0							#guarda o len(argv) do maior

for:										#for ( int i=0; i < argc; i++)
		bge $t2, $t0, endfor
		
		sll $t3, $t2, 2
		addu $t3, $t1, $t3
		lw $t3, 0($t3)
		move $a0, $t3
		li $v0, printString
		syscall
		
		la $a0, pontos
		li $v0, printString
		syscall

		
		li $t4,0							# $t4 = j
		li $t5,0 							#$t5 = count
		li $t7,0							#contador de letras
while:	
		addu $t4, $t3, $t5
		lb $t4, 0($t4)						# argv[i][j]
		beq $t4, '\0',endwhile
		
		blt $t4, 'A', endletraM
		bgt $t4, 'Z', endletraM
				
letraM:

		addi $t7, $t7, 1

endletraM:

		blt $t4, 'a', endletram
		bgt $t4, 'z', endletram
		
letram:

		addi $t7,$t7, 1

endletram:
				
		addi $t5, $t5,1
		
		j while
		
endwhile:
		
		ble $t5, $t9, endsalvar

salvar:
		move $t9, $t5
		move $t8, $t3

endsalvar:


		la $a0, msg1
		li $v0, printString
		syscall
		
		move $a0, $t5
		li $v0, printInt
		syscall
		
		la $a0, pontovirgula
		li $v0, printString
		syscall
		
		la $a0, msg2
		li $v0, printString
		syscall
		
		move $a0, $t7
		li $v0, printInt
		syscall

		la $a0, nextline
		li $v0, printString
		syscall
		
		addi $t2, $t2, 1
		j for
endfor:
		
		la $a0, msg3
		li $v0, printString
		syscall
		
		move $a0, $t8
		li $v0, printString
		syscall
		
		jr $ra
