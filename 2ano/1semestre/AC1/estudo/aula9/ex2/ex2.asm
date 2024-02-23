			.data
			
			.text
			
			.globl main
			
			
main:		
			
			addiu $sp, $sp, -4
			sw $ra,0($sp)


do:

			li $v0, 7
			syscall
			
			mov.d $f12, $f0
			
			jal f2c
			
			mov.d $f12, $f0
			li $v0, 3
			syscall 
			
while:	


			mtc1 $0, $f2

			cvt.d.w $f2, $f2
		
			c.eq.d $f0, $f2
			bc1f  do
		
						
			lw $ra,0($sp)
			addiu $sp, $sp, 4
		
			li $v0, 0
			jr $ra
			
			
			