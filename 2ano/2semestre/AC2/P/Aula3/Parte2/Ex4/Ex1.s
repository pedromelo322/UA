        .data

        .equ ADDR_BASE_HI,0xBF88
        .equ TRISB,0x6040
        .equ PORTB,0x6050
        .equ LATB,0x6060
        .equ TRISE,0x6100
        .equ PORTE,0x6110
        .equ LATE,0x6120
        .equ READ_CORE_TIMER, 11
        .equ RESET_CORE_TIMER, 12

        .text
        .globl main



main:

        addi $sp, $sp, -4
        sw $ra, 0($sp)



        lui $s1, ADDR_BASE_HI

        lw $t0, TRISB($s1)
        ori $t0, $t0, 0x000E
        sw $t0, TRISB($s1)

        lw $t0, TRISE($s1)
        andi $t0, $t0, 0xFFE1
        sw $t0, TRISE($s1) 


        li $s2, 1




while:




        lw $t0, LATE($s1)
        andi $t0, $t0, 0xFFE1
        sll $t3, $s2, 1
        or $t0, $t0, $t3
        sw $t0, LATE($s1)

        lw $t0, PORTB($s1)
        andi $t0, $t0, 0x0002
        srl $t0, $t0, 1


if:
        bne $t0, 1, else


        jal delay

        
        sll $s2,$s2,1

if2:
       bne $s2, 0x0010, endif2

       li $s2, 1

        
endif2:

        j endif
else:

        jal delay

        
        srl $s2,$s2,1


if3:
       bne $s2, 0x0000, endif3

       li $s2, 0x0008

        
endif3:


endif:





        j while

        lw $ra, 0($sp)
        addi $sp, $sp, 4



        jr $ra





delay:

        li $v0,RESET_CORE_TIMER
        syscall


        addi $sp, $sp, -4
        sw $ra, 0($sp)



wait:   li $v0,READ_CORE_TIMER
        syscall
        
        blt $v0,6666666,wait # e.g. f=4.6Hz


        
        lw $ra, 0($sp)
        addi $sp, $sp, 4

        jr $ra




