.data

.equ BassHigh, 0xBF88
.equ TRISE, 0x6100
.equ PORTE, 0x6110
.equ LATE, 0x6120

.text
.globl main




main:

    lui $s2, BassHigh
    lw $t0, TRISE($s2)
    andi $t0, $t0, 0xFFE1
    sw $t0, TRISE($s2)

    li $s3,0x0009



while:

    sll $t1, $s3, 1
    lw $t0, LATE($s2)
    andi $t0, $t0, 0xFFE1
    or $t0, $t0, $t1
    sw $t0, LATE($s2)


    li $t0, 4
    sll $t0, $t0, 16
    xori $t0, $t0, 2

    move $a0, $s3
    move $a1, $t0
    li $v0, 6
    syscall

    li $v0, 3
    li $a0, '\r'
    syscall





    li $a0, 249
    jal delay

    xori $s3, $s3, 0x000f


    j while


    jr $ra



delay:

    move $t2, $a0

    mul $t2, $t2, 20000

    li $v0, 12
    syscall


wait:

    li $v0, 11
    syscall
    blt $v0, $t2, wait

    jr $ra