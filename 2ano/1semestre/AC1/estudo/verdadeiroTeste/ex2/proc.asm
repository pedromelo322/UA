			.data
			
zero:		.double 0.0
			
			
			.text
			.globl proc
			
			
#preencha com os registos usados
#Mapa de registos
#array : $t1
#thd : $f2
#val: $f4
#n: $t2
# i: $t3
# aux: $f6
# sum: $f	8	
			
proc:

			move $t1, $a0
			mov.d $f2, $f12
			mov.d $f4, $f14
			move $t2, $a1
			
			la $t0, zero		
			l.d $f8, 0($t0)		# sum = 0.0
			
			
			li $t3, 0			# i =0 
for:
			bge $t3, $t2, endfor	# i < n
			
			sll $t0, $t3, 3
			addu $t0, $t1, $t0	
			l.d $f0, 0($t0)		# array[i]
			add.d $f6, $f0, $f4		#aux = array[i] + val;
			
if:			c.le.d	$f6, $f2 		# if (aux > thd)
			bc1f 	else

			
			s.d $f2, 0($t0)		#array[i] = thd;
			add.d $f8, $f8, $f2		#sum += thd;
			
			j endif
else:
			
			s.d $f6, 0($t0)		#array[i] = aux;
			add.d $f8, $f8, $f6		#sum += aux;

endif:			
			
			addi $t3, $t3, 1		# i++
			j for
			
endfor:
			mtc1 $t2, $f0
			cvt.d.w $f0, $f0		# (double) n
			
			div.d $f0, $f8, $f0			
			
			jr $ra