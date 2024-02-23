		.data
		.text
		.globl main
	
main:	
		ori $t1,$0,0xE543
		and $t2,$t0,$t1
		or  $t3,$t0,$t1
		nor $t4,$t0,$t1
		xor $t5,$t0,$t1
	
		jr $ra