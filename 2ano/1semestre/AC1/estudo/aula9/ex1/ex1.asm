			.data
			
			
constante:	.float 2.59375
			
			.text
			.globl main
			
			
			
main:	

	
do:

		li $v0, 5
		syscall
		
		mtc1	$v0, $f0
		
		cvt.s.w	$f0, $f0
		
		la $t0, constante
		
		l.s	$f2, 0($t0)
		
		mul.s $f4, $f2, $f0
		
		mov.s $f12, $f4
		
		li $v0, 2
		syscall


while:	


		mtc1 $0, $f6 

		cvt.s.w $f6, $f6
		
		c.eq.s $f4, $f6
		bc1f  do
		
		li $v0, 0
		jr $ra