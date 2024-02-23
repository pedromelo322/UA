
			
# 	i:	$t0				
			.data
			
			.eqv size, 3
			.eqv printString, 4
			
array:		.word str1, str2, str3

str1:			.asciiz "Array"

str2:			.asciiz "de"

str3:			.asciiz "ponteiros"


newline:		.asciiz "\n"
			
			.text
			.globl main
					
							
main:

			la $t1, array

			li $t0,0
			
			li $t3, size
			sll $t3, $t3, 2
			
for:		
			bge $t0,$t3,endfor
			
			addu $t2 ,$t1 ,$t0

			lw $a0, 0($t2)
				
			li $v0, printString
			syscall
			
			la $a0, newline
			li $v0, printString
			syscall
				
			addi $t0,$t0,4
			j for
endfor:	


			jr $ra
	
	
			
			
			