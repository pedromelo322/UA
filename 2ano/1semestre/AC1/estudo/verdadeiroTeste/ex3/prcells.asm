# typedef struct
# {		 			Alignment	Size 	Offset
# char smp[10]; 		1			10		0
# double av;    		8			8		10 -> 16
# int ns;        			4			4		24
# char id; 			1			1		28
# int sum;			4			4		29 -> 32
# } t_cell; 			8			40


#preencha com os registos usados
#Mapa de registos
# tc : $t1
# size: $t2
# res : $f2
# aux: $f4
# i: $t3
# tc[i]: $t4

			.data
			
zero:		.double 0.0
num:		.double 3.597
			
			.text
			.globl prcells
			
			
prcells:

			move $t1, $a0
			move $t2, $a1
			
			la $t0, zero
			l.d $f2, 0($t0)		#res = 0.0
			
			li $t3, 0			# i = 0

for:			bge 	$t3, $t2, endfor	# i < size
			
			mul $t0, $t3, 40		# i * 40
			addu $t4 , $t1, $t0		# tc[i]
									
			lw $t0, 24($t4)			# tc[i].ns
			mtc1	$t0, $f0
			cvt.d.w 	$f0, $f0		# (double) tc[i].ns
			
			la $t0, num
			l.d $f6, 0($t0)			# 3.597
			
			div.d $f4, $f0, $f6		# aux = (double) tc[i].ns / 3.597;
			
			add.d $f2, $f2, $f4		#res = res + aux;
			
			s.d $f4, 16($t4)		# tc[i].av = aux;
			
			
			cvt.w.d	$f0, $f2		# int(res)
			mfc1 $t0, $f0
			sw $t0, 32($t4)		# tc[i].sum = (int)res;			

	
			addi $t3, $t3, 1		# i++
			j for
endfor:	

			mov.d $f0, $f2
			
			jr $ra
			
			
			