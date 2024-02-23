# typedef struct
# {						Align 	size		Offset
#	char id;				1		1		0
#	double av;			8		8		8
#	int ns;				4		4		16
#	char smp[18];			1		18		20
#	int sum;				4		4		40
# }	t_sample: 			8		48


#Mapa de registos:
#	ts:	$t1
#	nval:	 $t2
#	sum:	 $f2
#	n: $t3
#	k: $t4
#	acc:	$t5
#	pu: $t6

			.data
			
			
			.align 3
zero:			.double 0.0
			
			
			
			.text
			.globl process
			
			
process:		

			move $t1, $a0			#ts	
			move $t2, $a1			# nval
			
			la $t0, zero				#ponteiro de 0.0
			l.d $f2, 0($t0)				#sum = 0.0 -> tipo double
			
									# int n -> $t3
									# int k -> $t4
			
			li $t5, 0					# int acc  = 0
			
			mul $t0, $t2, 48  			# nval * sizeof(t_sample)
			addu $t6, $t1, $t0  		# pu = ts + nval * sizeof(t_sample)
			
			
for:			bge	$t1, $t6, endfor		# ts < pu

			li $t4, 0					# k= 0
subfor:		
			
			lw $t7, 16($t1)			# ts->ns
			bge $t4, $t7, endsubfor		# k < ts-ns
			
			addiu $t0, $t1, 20			# offset do char smp[18]
			addu  $t0, $t0, $t4			# ponteiro do smp[k]
			
			lb $t0, 0($t0)				#  ts->smp[k],		vai buscar valor smp[k]
			
			addu $t5, $t5, $t0			# acc += ts->smp[k]
				
			addi $t4, $t4, 1			# k++
			j subfor	
endsubfor:

			sw $t5, 40($t1)			# ts -> sum = acc
			
			mtc1 $t5, $f4				# acc no cp1
			cvt.d.w $f4, $f4			# (double) acc
			
			 mtc1 $t7, $f6				# ts -> ns no cp1
			 cvt.d.w $f6, $f6			# (double) ts->ns
			 
			 div.d $f0, $f4, $f6			# (double) acc / (double) ts -> ns
			 
			 s.d $f0, 8($t1)			# ts -> av = (double) acc / (double) ts -> ns
			 
			 add.d $f2, $f2,$f0			# sum += ts -> av
			  

			addiu $t1, $t1, 48			# ts++
			j for
endfor:

			cvt.s.d $f2, $f2			#(float) sum
			mov.s $f0, $f2			
			
			jr $ra
			
			
			
			
			
			
