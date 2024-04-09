.data

.equ BassHigh, 0xBF88
.equ TRISE, 0x6100
.equ PORTE, 0x6110
.equ LATE, 0x6120




.text
.globl main


main:


    lui $t2, BassHigh

    lw $t0, TRISE($t2)
    andi $t0, $t0, 0xFFC3
    sw $t0, TRISE($t2)


    li $t1, 0x0001

while:

    li $a0, 434
    jal delay

    lw $t0, LATE($t2)
    andi $t0, $t0, 0xFF83
    sll $t3, $t1, 2 
    or $t0, $t0, $t3
    sw $t0, LATE($t2)


    sll $t1, $t1, 1

if:
    bne $t1,0x0010 ,else
    li $t1, 1


else:


    j while


    jr $ra






delay:

    mul $t0, $a0, 20000

    li $v0, 12
    syscall

wait:

    li $v0, 11
    syscall


    blt $v0, $t0, wait


    jr $ra




