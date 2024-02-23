 	.data
 	
nextline:	.asciiz "\n"
doispontos:	.asciiz ":"
 	.align 3
zero: .double 0.0


t_sample:
    	.align 0
    	 .byte 'A'
    	.align 3
    	 .double 1.0
    	.align 2
    	 .word 18
    	.align 0
    	.ascii "ABCDEFGHIJKLMNOPQR"
    	.align 2
    	.word .align 3

    # Definição e inicialização de mais duas estruturas t_sample para totalizar 3
t_sample2:
    	.align 0
    	.byte 'B'
    	.align 3
    	 .double 2.0
    	.align 2
    	.word 18
    	.align 0
    	.ascii "ABCDEFGHIJKLMNOPQR"
    	.align 2
    	.word 0
    	.align 3

t_sample3:
    	.align 0
    	.byte 'C'
    	.align 3
     	.double 3.0
    	.align 2
    	.word 18
    	.align 0
    	.ascii "ABCDEFGHIJKLMNOPQR"
    	.align 2
    	.word 0
    	.align 3

    	.text
    	.globl main

main:

	addiu $sp, $sp, -4
	sw	$ra, 0($sp)
	
    # Inicialização simplificada de um array de t_sample
 	la $a0, t_sample  # ts
 	li $a1, 3  # nval
 
    # Chamada da função process
	jal process

	# Impressão das estruturas
    	la $a0, t_sample
    	jal print_t_sample
    	la $a0, t_sample2
    	jal print_t_sample
    	la $a0, t_sample3
    	jal print_t_sample
    

	
	lw	$ra, 0($sp)
	addiu $sp, $sp, 4

	jr $ra
	
	
	
print_t_sample:
    # Impressão simplificada de uma estrutura t_sample
    	
    	move $t0, $a0
    
   	lb $a0, 0($t0)  # id
    	li $v0, 11
    	syscall
    	 la $a0, doispontos
    	li $v0, 4
    	syscall
    	l.d $f12, 8($t0)  # av
    	li $v0, 3
    	syscall
    	la $a0, doispontos
    	li $v0, 4
    	syscall
    	lw $a0, 16($t0)  # ns
    	li $v0, 1
    	syscall
    	la $a0, doispontos
    	li $v0, 4
    	syscall
     	addiu $a0, $t0, 20   # smp[18]
    	li $v0, 4
    	syscall
    	la $a0,  doispontos
    	li $v0, 4
    	syscall
	lw $a0, 40($t0)  # sum
   	 li $v0, 1
   	 syscall
   	la $a0, nextline 
    	li $v0, 4
    	syscall
    
    	jr $ra