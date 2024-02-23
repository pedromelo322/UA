			.data
			
			
			.text
			.globl max
			
			
			
max:			

			# $a0 = p;	$a1 = n

			sll $a1, $a1, 3					#(nx8) -> incremento ponteiro double
			addi $t1, $a1,-1				# n-1
			addu $t1, $t1, $a0				# u = p + n - 1
			
			l.d $f2, 0 ($a0)				# max = *p
			addi $a0, $a0, 8				# p++
			  
			  
for:			bgt	$a0, $t1, endfor			# if p <= u


			l.d $f0, 0 ($a0)				#temp = *p
if:			c.le.d $f0, $f2		 			# if *p > max
			bc1t endif

			mov.d $f2, $f0					# max = *p

endif:	
			addi $a0, $a0, 8				#(p += 8) = (p++) -> incremento ponteiro double
			j for
endfor:

			mov.d $f0, $f2
			
			jr $ra
			  