			.data

f1:			.asciiz "\nN.Mec: "

f2:			.asciiz "\nNome: "

f3:			.asciiz "\nNota: "	

f4:			.asciiz  "\nPrimeiro Nome: "	

f5:			.asciiz "\nSegundo Nome: "

			.space 2	
				
stg:			
			.space 4
			.space 18
			.asciiz "Bonaparte"
			.space 5
			.align 2
			.float 5.1	
			
					
							
			.text
			.globl main
			
			
			
main:		
			la $s1, stg


			la $a0, f1
			li $v0, 4
			syscall
			
			
			li $v0, 5
			syscall
			sw $v0, 0($s1)
			
			la $a0, f4
			li $v0, 4
			syscall
			
			addiu $a0, $s1, 4
			li $a1, 17
			li $v0, 8
			syscall
			
			la $a0, f5
			li $v0, 4
			syscall
			
			addiu $a0, $s1, 22
			li $a1, 14
			li $v0, 8
			syscall
			
			la $a0, f2
			li $v0, 4
			syscall
			
			addiu $a0, $s1, 4
			li $v0, 4
			syscall
			
			li $a0, ','
			li $v0, 11
			syscall
			
			addiu $a0, $s1,22
			li $v0, 4
			syscall
			
			
			la $a0, f3
			li $v0, 4
			syscall
			
			l.s $f12, 40($s1)
			li $v0, 2
			syscall
			
			li $v0,0
			jr $ra
			
 
  			 