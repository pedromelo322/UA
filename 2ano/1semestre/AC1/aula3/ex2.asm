# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2
# mask: $t3

    .data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "\nO valor em binario e': "
        .eqv print_string, 4
        .eqv read_int, 5
        .eqv print_char, 11
        .text
        .globl main
        
main: 	la $a0, str1			# print_string("Introduza um numero: ");
        li $v0, print_string
        syscall
        li $v0, read_int		# value = read_int();
        syscall
        move $t0, $v0
        
        li $t2, 0				# i = 0
        li $t3, 0x80000000		# mask = 0x80000000
        
for: 	blt $t2, 32, endfor		# while(i < 32) {
        and $t1, $t0, $t3		# bit = value & mask
        bne $t1, $0, else		# if(bit != 0)
        li $a0, '1'				# print_char('1');
        j print
else: 	li $a0, '0'				# else print_char('0');
print: 	li $v0, print_char
        syscall
        sll $t0, $t0, 1			# value = value << 1;
        addi $t2, $t2, 1		# i++;
        j for					# }
endfor: la $a0, str2			# print_string("\nO valor em binario e': ");
        li $v0, print_string
        syscall
        jr $ra					# fim do programa