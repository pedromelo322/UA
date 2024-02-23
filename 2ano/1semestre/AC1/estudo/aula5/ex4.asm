#	Mapa de Registos
#	



			.data
		
			.eqv size, 3
			.eqv True, 1
			.eqv False, 0
			.eqv print_string, 4
			.eqv read_int10, 5
			.eqv print_int10, 1
		
str: 			.asciiz  "\nIntroduza um numero: "

			.align 2
array:		.space 12
			.text
			.globl main
		
main:	
			
			li $t0, 0			#	i
			la $t1, array		#	static int lista[SIZE]
		
for:			
			bge $t0,size,endfor	#	i < SIZE

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
			
			la $t4, array		#	static int lista[SIZE]
			li $t3, size
			addi $t3, $t3, -1
			sll $t3, $t3, 2
			addu $t9, $t4, $t3
			
			
			
do:		
			la $t4, array		#	static int lista[SIZE]
			li $t3, 0			#	temp
			li $t0, 0			#	i = 0
			li $t1, False		#	houveTroca
			li $t2, 0			# 	aux
			
for2:		

			bge $t4, $t9,endfor2	# p < pUltimo
			
			
if:			
			addi $t5,$t4,4 		#lista[i+1]
			lb $t6,0($t4)
			lb $t7,0($t5)
			ble	$t6,$t7,endif
			
			move $t2, $t6			#aux = lista[i]
			move $t6, $t7			#lista[i] = lista[i+1]
			move $t7, $t2			#lista[i+1] = aux
			li $t1, True			#houveTroca = TRUE	
			
			sb $t6,0($t4)
			sb $t7,0($t5)
											
endif:
			
			addi $t4, $t4, 4		

			j for2
			
endfor2:

			beq $t1, True, do
			la $t4, array		#	static int lista[SIZE]
forint:		


			
			bgt	$t4,$t9,endforint
			
			lb $a0,0($t4)
			li $v0,print_int10
			syscall
			
			addi $t4, $t4, 4
			
			j forint
			
			
endforint:			
			li $v0,0
			jr $ra
			
			
		
		