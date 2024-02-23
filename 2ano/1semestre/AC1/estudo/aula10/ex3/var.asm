			.data
			
zero:		.float 0.0
			
			.text
			.globl var
			
			
			
			
var:			

			addiu $sp, $sp, -16
			sw $ra, 0($sp)
			sw $s1, 4($sp)
			sw $s2, 8($sp)
			sw $s3, 12($sp)
			

			move $s1, $a0   			#double *array
			move $s2, $a1   			#int nval
			
			
			jal average				#average(array, nval)
			cvt.s.d $f2, $f0			# media = (float)average(array, nval)
			
			
			li $s3, 0					# i = 0
			la $t0, zero		
			l.s $f4, 0($t0)				#soma = 0.0
									
			
for:			

			bge	$s3, $s2,endfor		# i < nval
			
			
			sll $t0, $s3, 3			# i * 8, array de double
			addu $t0, $s1,$t0			#	ponteiro de array[i]
			l.d $f12 ,0($t0)				# array [i]
			
			cvt.s.d $f12, $f12			# (float) array[i]
			
			sub.s $f12 , $f12, $f2 				# (float) array[i] - media
			
			li $a0, 2
			
			jal xtoy					# xtoy((float)array[i] - media, 2)
			
			add.s $f4, $f4,$f0				# soma += xtoy((float)array[i] - media, 2)

			addi $s3, $s3, 1			# i++
			j for

endfor:			
			
			cvt.d.s $f4, $f4			# (double) soma
			
			
			mtc1   $s2, $f0
			cvt.d.w $f0, $f0			# (double) nval
			
			div.d $f0, $f4, $f0			# return (double)soma / (double)nval
			
			
			lw $ra, 0($sp)
			lw $s1, 4($sp)
			lw $s2, 8($sp)
			lw $s3, 12($sp)
			addi $sp, $sp, 16
			
			jr $ra
			