			.data
um:			.double 1.0
zero:		.double 0.0			
zerocinco:	.double 0.5
			.text
			.globl sqrt
sqrt:
			addiu $sp, $sp, -4
			sw $ra, 0($sp)
								# f12 = val
			la $t0, um			# temp = ponteiro de 1.0
			l.d $f2, 0($t0)			# xn = 1.0
			la $t0, zero			# temp = ponteiro de 1.0
			l.d $f0, 0($t0)			# temp = 0
			li $t1, 0				# i = 0
if:			
			c.le.d $f12, $f0			#if(val > 0.0)
			bc1t else
do:			
			mov.d	$f4, $f2		# aux = xn;
			div.d 	$f0, $f12, $f2	#temp = val/xn
			add.d 	$f2, $f0, $f2	#xn = (xn + val/xn)
			la $t0,zerocinco
			l.d $f0,0($t0)			#temp = 0.5
			mul.d 	$f2,$f0, $f2	# xn = 0.5 * (xn + val/xn)
while:		
			addi $t1, $t1, 1
			c.eq.d $f4,$f2
			bc1t	enddo
			bge $t1,25,enddo
			j do
enddo:		
			j endif
else:
			la $t0, zero
			l.d $f2, 0($t0)

endif:								
			lw $ra, 0($sp)
			addiu $sp, $sp, 4
			mov.d $f0, $f2
			jr $ra
			
			
			