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
char5:	.byte 's'
char6:	.byte 'r'
	
	.text
	.globl main
	
	
	
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $s1, 0	#int state = 0
	li $s2, 0	#int cnt = 0
	li $s3, 0	#char c
	li $s4, 0	#stop = 0
	

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


	la $t0,char5
	lb $t0, 0($t0)
	
if3:	bne $s3,$t0,endif3	#if(c == 's')


if6:
	beq $s4, 1, else6
	
	li $s4, 1

	j end6

else6:

	li $s4, 0

end6:
	

endif3:

	la $t0,char6
	lb $t0, 0($t0)

if4:	bne $s3,$t0,endif4	#if(c == 'r')

	li $s2, 0	#cnt = 0

endif4:

if5:	beq $s4,1,endif5


if:

	bne $s1, UP, else	#if(state == UP)

	addi $s2, $s2, 1
	andi $s2,$s2,0xFF	#cnt = (cnt+1)&0xFF
	

	j endif
	
else:

	addi $s2, $s2, -1
	andi $s2,$s2,0xFF	#cnt = (cnt+1)&0xFF


endif:

endif5:


while:	

	bne $s3,'q',do	#while (c != 'q')
	
	li $v0, 0
	
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra		#return 0


wait:

	addi $sp, $sp, -20
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	sw $s4, 12($sp)
	sw $ra, 16($sp)
	
	
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
	lw $s2, 4($sp)
	lw $s3, 8($sp)
	lw $s4, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
