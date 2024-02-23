#Pretende-se escrever um programa, em linguagem assembly, que implemente a expressão
#aritmética y = 2x + 8. Supondo que o valor de x é passado através do registo $t0 ($8)
#do CPU e que o resultado é depositado no registo $t1 ($9), uma possível solução é:


# y=$t1
#x=$t0
		
		.data
		.text
		.globl main
		
main:	ori $t0,$0,3
		ori $t2,$0,8 	

		add	$t1,$t0,$t0
		add $t1,$t1,$t2
		
		jr $ra
		
		