# 	Mapa de Registos
#	$t0:	i
#	$t1:	lista
#	$t2: (lista+i)
			
						
			.data
			
			.eqv size, 5
			.eqv read_int10, 5
			.eqv print_string, 4
			
str: 			.asciiz  "\nIntroduza um numero: "
			
			.align 2
			
array:		.space 20



			.text
			.globl main
			
main:		
			
			li $t0, 0				#	int i
			la $t1, array			#	static int lista[SIZE]
			
for:			bge $t0,size,endfor	#	i < SIZE



			la $a0, str
			li $v0, print_string
			syscall				#	print_string(str)
			
			li $v0, read_int10		
			syscall
			
			
			sll $t2, $t0, 2			# $t4 = i x 4
			addu $t2, $t2, $t1		# $t2: lista[0] + (ix4)
			
			
			sb $v0,0($t2)
 			
  			addi $t0,$t0,1			#	i++
  			j for
endfor: 
			li $v0,0
  			jr $ra

			
			
			
