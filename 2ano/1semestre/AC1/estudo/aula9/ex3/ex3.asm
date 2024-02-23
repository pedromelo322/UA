			.data
			
			
			.eqv size, 10
			
a:			.space 80
			
			.text
			.globl main
			
			
	
main:		
			addiu $sp, $sp, -4
			sw $ra, 0 ($sp)



			

			li $s1, 0 		# i =0
			la $s2, a		# ponteiro da array
			
for:
			bge	$s1,size,endfor		#i < size
			
			sll $s3, $s1, 3				
			addu $s3, $s2, $s3			#a[i]
			
			li $v0, 7					#read_double
			syscall
			
			s.d $f0, 0($s3)			#a[i] = read_double
			
			
			addi $s1, $s1, 1			#i++
			
			j for
endfor:



			move $a0, $s2
			li $a1, size
			jal average			#average(a, size)
			
			mov.d $f12, $f0
			li $v0, 3
			syscall				#print_double(...)
			
			li $v0, 0
			
			
			lw $ra, 0 ($sp)
			addiu $sp, $sp,4
			
			jr $ra
			