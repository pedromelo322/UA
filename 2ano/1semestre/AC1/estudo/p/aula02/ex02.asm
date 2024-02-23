	.data
	.text
	.globl main

main:
	li $t0,2    #num = gray
	
	srl $t1, $t0, 4		#num2 = num >> 4
	xor $t0, $t1, $t0 	#num = num2 ^ num 
	
	srl $t1, $t0, 2  	#num2 = num >> 2
	xor $t0, $t1, $t0	#num = num2 ^ num
	
	srl $t1, $t0, 1
	xor $t0, $t1, $t0
	
	or $t2, $t0, $0
	
	jr $ra
