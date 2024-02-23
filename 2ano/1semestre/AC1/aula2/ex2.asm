		.data
		.text
		.globl main
		
main:
		ori $t0,$0,7 #t0 = num(gray)
		srl  $t1,$t0,4  #t1 = (num >> 4)
		xor $t0,$t0, $t1  #t0 = num xor t1
		srl  $t1,$t0,2 #t1 = (num >> 4)
		xor $t0,$t0, $t1 #t0 = num xor t1
		srl  $t1,$t0,1 #t1 = (num >> 4)
		xor $t2,$t0, $t1
		jr $ra