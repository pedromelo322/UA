			.data
			
			.eqv size,3
			.eqv printString,4
			
			
array:		.word str1, str2, str3

str1:			.asciiz "Array"

str2:			.asciiz "de"

str3:			.asciiz "ponteiros"


newline:		.asciiz "\n"

	
			.text
			.globl main
			
					
main:

			la $t0, array
			li $t2, size
			sll $t2, $t2 ,2
			addu $t2, $t0,$t2
			lw $t2,0($t2)
			li $t3,4
for:			
			lw $t1, 0($t0)
			bge 	$t1, $t2, endfor
			
			move $a0, $t1
			li $v0, printString
			syscall
			
			la $a0, newline
			li $v0, printString
			syscall
			
			
			addu $t0,$t0,$t3
			j for		
endfor:
			
			jr $ra  
			
			