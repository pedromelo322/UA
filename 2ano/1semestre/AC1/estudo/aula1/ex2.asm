		.data
		.text
		.globl main
	
		#x = $t0
		#y = $t1
	
		#y = 2x - 8
	
main:	ori $t0,$0,5
		ori $t2,$0,8
		
		 add $t1,$t0,$t0
		 sub $t1,$t1,$t2
		 
		  jr $ra 
	