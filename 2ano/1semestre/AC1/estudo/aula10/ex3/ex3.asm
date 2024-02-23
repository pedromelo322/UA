			.data

			.eqv size, 10
			
			.align 8 
			
arr:			.space 80	

um:			
			
			.text
			.globl main
			
			
			
main:		

			addiu $sp, $sp, -16
			sw $ra, 0($sp)
			sw $s0, 4($sp)
			sw $s1, 8($sp)
			sw $s2, 12($sp)

			
			li $s1, 0			# i ++
			la $s2, arr		#arr
			
			

for:			bge $s1,size,endfor			# if i < size

			sll $t0, $s1, 3
			addu $t0, $s2, $t0

			li $v0, 7
			syscall
			
			s.d $f0, 0($t0)

			addi $s1, $s1 ,1				# i++
			j for
endfor:



			move $a0, $s2
			li $a1, size
			
			jal average
			
			mov.d $f12, $f0
			li $v0, 3
			syscall
			
			move $a0, $s2
			li $a1, size
			
			jal var
			
			mov.d $f12, $f0
			li $v0, 3
			syscall
			
			move $a0, $s2
			li $a1, size
			
			jal stdev
			
			
			mov.d $f12, $f0
			li $v0, 3
			syscall
			
			
			
			lw $ra, 0($sp)
			lw $s0, 4($sp)
			lw $s1, 8($sp)
			lw $s2, 12($sp)
			addiu $sp, $sp, 16
			
			jr $ra
