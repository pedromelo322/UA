
			.data
			
			
			
			.text
			.globl primes
			
#Copie para o topo da área de resposta e
#preencha com os registos usados
#Mapa de registos
#array : $s1
#Iow : $s2
#high : $s3
#i: $s4
#npr : $s5
#p: $s6						
			
primes:


		addiu $sp, $sp, -24
		sw $ra, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)

		move $s1, $a0
		move $s2, $a1
		move $s3, $a2

	
		move $s6, $s1		# p = array
		
		addi $s4, $s2, 1		# i = low + 1
		li $s5, 0				#npr = 0
for:		
		bge $s4, $s3, endfor	# i < high
		
		move $a0, $s4
		jal checkp				#checkp(i)

if:		
		bne  $v0, 1, endif		# checkp(i) == 1

		sw $s4, 0($s1)		# *array = i
		addiu $s1, $s1, 4		# array++
		addi $s5, $s5, 1		# npr++
		
endif:
		
		addi $s4, $s4, 1		# i++
		j for	

endfor:
		sll $t0, $s5, 2
		addu $s6, $s6, $t0
		sw $s5, 0($s6)
		
		move $v0, $s5
		
				
		lw $ra, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		addiu $sp, $sp, 24
		
		jr $ra
			
		


			