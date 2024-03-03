	.equ printStr,8
	.equ readStr, 9
	.equ SIZE, 20
	.equ putChar, 3
	.equ printInt, 6
	.equ printInt10, 7
	
	.data
	
	
str1:	.space 21
str2:	.space 21
str3:	.space 41
str4:	.asciiz "Introduza 2 strings: "
str5:	.asciiz "\nResultado:"
debug:	.asciiz "\nFunciona\n"
straux:	.asciiz "\n>"

	.text
	.globl main
	
main:

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $s1, str1	#static char str1[SIZE + 1];
	la $s2, str2	#static char str2[SIZE + 1];
	la $s3, str3	#static char str3[2 * SIZE + 1];
	
	la $a0, str4
	li $v0, printStr
	syscall
	
	la $a0, straux
	li $v0, printStr
	syscall
	
	la $a0, str1
	li $a1, SIZE
	li $v0, readStr
	syscall
	
	la $a0, straux
	li $v0, printStr
	syscall

	
	la $a0, str2
	li $a1, SIZE
	li $v0, readStr
	syscall
	
	la $a0, str5
	li $v0, printStr
	syscall
	
	la $a0, straux
	li $v0, printStr
	syscall
	
	la $a0, str1
	jal strlen
	
	
	move $a0, $v0
	li $a1, 10
	li $v0, printInt
	syscall
	
	la $a0, straux
	li $v0, printStr
	syscall
	
	la $a0, str2
	jal strlen
	
	
	move $a0, $v0
	li $a1, 10
	li $v0, printInt
	syscall
	
	
	la $a0, str3
	la $a1, str1
	jal strcpy
	
	move $a0, $v0
	la $a1, str2
	jal strcat
	move $s2, $v0

	
	la $a0, straux
	li $v0, printStr
	syscall
	
	move $a0, $s2
	li $v0, printStr
	syscall
	
	
	la $a0, str1
	la $a1, str2
	jal strcmp


	move $a0, $v0
	li $v0, printInt10
	syscall	
	
	
		
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
	
	
	
strlen:

	li $t1, 0
	move $t2, $a0
	

	
for:	

	lb $t0, 0($t2)
	
	beqz $t0,endfor
	
	addi $t2,$t2,1
	addi $t1, $t1, 1
	
	j for
	
	
endfor:



	move $v0, $t1
	jr $ra
	
	
strcpy:

	move $t1, $a0
	
	
	
for2:	

	lb $t0,0($a1)
	sb $t0,0($a0)
	
	beqz $t0, endfor2
	
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	
	
	j for2
	
	
endfor2:


	move $v0, $t1
	jr $ra



strcat:


	addi $sp, $sp, -8
	sw $s1,0($sp)
	sw $ra,4($sp)


	move $s1, $a0
	
	
for3:	

	lb $t0, 0($a0)
	beq $t0,0,endfor3
	
	addi $a0, $a0, 1
	
	
	j for3
	
	
endfor3:

	jal strcpy
	

	move $v0, $s1
	
	lw $s1,0($sp)
	lw $ra,4($sp)
	addi $sp, $sp, 8
	
	
	jr $ra
	
	
	
strcmp:


for4:

	lb $t1,0($a0)
	lb $t2,0($a1)
	
	
	bne $t1,$t2,endfor4
	
	beq $t1,0,endfor4
	
	
	
	
	addi $a0, $a0, 1
	addi $a1, $a1, 1

	j for4

endfor4:


	sub $v0, $t1, $t2
	
	jr $ra
	
	
	
