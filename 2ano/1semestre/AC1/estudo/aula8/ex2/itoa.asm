			.data
			
			
			.text
			.globl itoa
			
			
			
itoa:

			addi $sp, $sp, -20
			sw $ra, 0 ($sp)
			sw $s0, 4 ($sp)
			sw $s1, 8 ($sp)
			sw $s2, 12 ($sp)
			sw $s3, 16 ($sp)

			move $s0, $a0			#n	
			move $s1, $a1			#b
			move $s2, $a2			#s
			move $s3, $s2			#p = s
			
			
do:		

			rem $t0,$s0,$s1
			div $s0, $s0, $s1
			
			 move $a0, $t0
			  jal toascii 
			  
			  sb $v0, 0($s3)
			  addi $s3, $s3,1
			  
			  
while:		 bgtz $s0, do
		
		
			 li $t0, '\0'
			 sb $t0, 0($s3)
			 
			 move $a0, $s2
			 jal strrev
			
			move $v0, $s2
			
			lw $ra, 0 ($sp)
			lw $s0, 4 ($sp)
			lw $s1, 8 ($sp)
			lw $s2, 12 ($sp)
			lw $s3, 16 ($sp)
			addi $sp, $sp, 20
			
			

			jr $ra
			
			
toascii:

			addi $a0, $a0, '0'
			
if:			ble $a0, '9', endif

			addi $a0, $a0, 7

endif:
	
			move $v0, $a0
			
			jr $ra
