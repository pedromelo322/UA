	.equ UP, 1
	.equ DOWN, 0
	.equ putChar, 3
	.equ printInt, 6
	.equ inKey, 1
	
	.data
	
char1:	.byte '\r'
char2:	.byte '\t'
char3:	.byte '+'
char4:	.byte '-'
	
	.text
	.globl main
	
	
	
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $s1, 0	#int state = 0
	li $s2, 0	#int cnt = 0
	li $s3, 0	#char c
	

do:	
	
	la $a0, char1
	lb $a0, 0($a0)
	li $v0, putChar
	syscall		#putChar('\r')
	
	move $a0, $s2
	li $a1, 10
	li $t0, 3
	sll $t0, $t0, 16
	or $a1, $a1, $t0
	li $v0, printInt
	syscall		#printInt(cnt, 10 | 3 << 16)
	
	
	
	la $a0, char2
	lb $a0, 0($a0)
	li $v0, putChar
	syscall		#putChar('\t)
	
	
	move $a0, $s2
	li $a1, 2
	li $t0, 8
	sll $t0, $t0, 16
	or $a1, $a1, $t0
	li $v0, printInt
	syscall		#printInt(cnt, 2 | 8 << 16)
	
	
	li $a0, 5
	jal wait
	

	li $v0, inKey
	syscall
	
	move $s3, $v0	#c = inKey()
	
	
	la $t0,char3
	lb $t0, 0($t0)
	
if1:	bne $s3,$t0,endif1	#if(c == '+')

	li $s1, UP	#state = UP

endif1:

	la $t0,char4
	lb $t0, 0($t0)

if2:	bne $s3,$t0,endif2	#if(c == '-')

	li $s1, DOWN	#state = DOWN

endif2:



if:

	bne $s1, UP, else	#if(state == UP)

	addi $s2, $s2, 1
	andi $s2,$s2,0xFF	#cnt = (cnt+1)&0xFF
	

	j endif
	
else:

	addi $s2, $s2, -1
	andi $s2,$s2,0xFF	#cnt = (cnt+1)&0xFF


endif:


while:	

	bne $s3,'q',do	#while (c != 'q')
	
	li $v0, 0
	
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra		#return 0


wait:

	addi $sp, $sp, -16
	sw $s1, 0($sp)
	sw $s1, 4($sp)
	sw $s1, 8($sp)
	sw $ra, 12($sp)
	
	
	li $t1,0 		#int i; i=0
	move $t2, $a0		#ts
	li $t3,515000

for:	
	mult $t2, $t3
	mflo $t0
	bge $t1, $t0, endfor
	
	addi $t1, $t1, 1 
	
	j for
endfor:
	
	
	lw $s1, 0($sp)
	lw $s1, 4($sp)
	lw $s1, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra
