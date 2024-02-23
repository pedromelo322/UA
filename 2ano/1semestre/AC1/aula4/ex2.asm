		.data
str1:	 	.asciiz "; "
str2: 	.asciiz "\nConteudo do array:\n"
lista: 	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
		.eqv print_int10, 1
		.eqv print_string, 4
		.eqv SIZE, 10
		.text
		.globl main
main:
   		 # print_string("\nConteudo do array:\n");
    		la $a0, str2
    		li $v0, print_string
    		syscall

    		# p = lista;
    		la $t0, lista

    		# t2 = lista + SIZE;
    		li $t2, SIZE
    		sll $t2, $t2, 2
    		addu $t2, $t2, $t0

while:
    		# while(p < lista+SIZE) {
    		bge $t0, $t2, endw

    		# $t1 = *p;
    		lw $t1, 0($t0)

    		# print_int10(*p);
    		move $a0, $t1
    		li $v0, print_int10
    		syscall

    		# print_string("; ");
    		la $a0, str1
    		li $v0, print_string
    		syscall

    		# p++;
    		addiu $t0, $t0, 4

    		# }
    		j while

endw:
    		jr $ra