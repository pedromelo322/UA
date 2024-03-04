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


        li $s2, 0




while:




        lw $t0, LATE($s1)
        andi $t0, $t0, 0xFFE1
        sll $t3, $s2, 1
        or $t0, $t0, $t3
        sw $t0, LATE($s1)

        lw $t0, PORTB($s1)
        andi $t0, $t0, 0x0008
        srl $t0, $t0, 3


if:
        bne $t0, 1, else

        li $a0, 20000
        jal delay

        
        addi $s2,$s2,1
        andi $s2,$s2,0x000F
        # e.g. up counter MOD 16

        j endif
else:
        li $a0, 10000
        jal delay

        
        addi $s2,$s2,-1
        andi $s2,$s2,0x000F
        # e.g. up counter MOD 16


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

        mul $t0, $a0, 1000 


wait:   li $v0,READ_CORE_TIMER
        syscall
        
        blt $v0,$t0,wait # e.g. f=4.6Hz


        
        lw $ra, 0($sp)
        addi $sp, $sp, 4

        jr $ra




