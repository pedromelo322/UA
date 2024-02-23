

			.data
			
			.eqv printChar, 11
			.eqv printInt, 1
			.eqv printString, 4
			.eqv size, 3
			
array:		.word str1,str2,str3

str1:			.asciiz "Array"

str2:			.asciiz "de"

str3:			.asciiz "ponteiros"

msg:			.asciiz "\nString #"



			.text
			.globl main
			
main:		

			la $t0, array
			
			li $t1, 0
					
for:
			bge $t1,size,endfor
			
			 la $a0, msg
			 li $v0, printString
			 syscall
			 
			 move $a0, $t1
			 li $v0, printInt
			 syscall
			 
			 li $a0, ':'
			 li $v0, printChar
			 syscall
			 
			 sll $t2, $t1, 2
			 addu $t2, $t0, $t2
			 lw $t2, 0($t2)
			 
			  li $t3, 0
			  
			 
			 
			 
			 
while:
			lb $a0, 0($t2)
			
			beq $a0, '\0', endwhile
			
			li $v0,  printChar
			syscall
			
			li $a0, '-'
			li $v0, printChar
			syscall
			

			addi $t2, $t2, 1			
			j while
endwhile:



			addi $t1, $t1,1
			j for
endfor:


			jr $ra