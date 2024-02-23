			.data
			
			
			.text
			.globl average
			
			
			
average:

			
			addi $t1, $a1, -1		# int  i = n - 1
			
 	
			cvt.d.w $f2, $f2		# double sum = 0.0
			
for:			
			blt $t1, $0, endfor		# if i >= 0
			
			
			
			sll $t0, $t1, 3 
			addu $t0, $a0, $t0
			l.d $f4, 0($t0)		#array[i]
			
			add.d $f2, $f2, $f4		#sum += array[i]
			
			addi $t1, $t1, -1 		# i--
			
			j for
			
endfor:

			mtc1 $a1, $f0
			
			cvt.d.w	$f0, $f0

			div.d $f0, $f2, $f0		#sum / (double)n
			
			jr $ra
			