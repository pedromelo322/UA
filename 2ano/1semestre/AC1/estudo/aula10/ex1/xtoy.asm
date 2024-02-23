			.data
			
			
um:			.float 1.0
			
			
			.text
			.globl xtoy
			

xtoy:			

			addi $sp, $sp, -12
			sw $ra, 0($sp)
			sw $s0, 4($sp)
			sw $s1, 8($sp)	
				
			mov.s $f2, $f12			# f2 = x
			move $s0, $a0			# $s0 = y
			


			li $s1,0				#i=0
			la $t0,um				#temp = ponteiro do 1.0
			l.s $f0, 0($t0)			#result = 1.0	
			
for:	
			move $a0, $s0
			jal abs					#  abs(y)
			bge $s1, $v0, endfor		# if i < abs(y)
			
			
if:			blez $s0,else				# if y > 0

			mul.s $f0	, $f0, $f2			#result *= x;

			j endif
else:

			div.s $f0, $f0, $f2

endif:
			
			addi $s1, $s1, 1
			j for
endfor:

			
			lw $ra, 0($sp)
			lw $s0, 4($sp)
			lw $s1, 8($sp)	
			addi $sp, $sp,12

			jr $ra
			
			
abs:

if2:			bgez $a0,endif2 		#if val < 0
			
			nor $a0 ,$a0, $0
			addiu $a0 ,$a0,1
endif2: 
			move $v0, $a0
			jr $ra
