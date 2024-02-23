			.data
			
cinco:		.double 5.0

nove:		.double 9.0

trintadois:	.double 32.0


			
			.text
			
			.globl f2c
			
			
			
f2c:


			la $t0, trintadois
			l.d $f2, 0($t0)


			sub.d $f12, $f12, $f2
			
			la $t0, cinco
			l.d $f2, 0($t0)
		
			
			la $t0, nove
			l.d $f4, 0($t0)
	
			
			div.d $f2, $f2 ,$f4
			
			mul.d $f0, $f2, $f12
			
			jr $ra
			
						
			