.data

.equ ADDRHIGH, 0xBF88
.equ TRISE, 0x6100
.equ PORTE, 0x6110
.equ LATE, 0x6120

.text
.globl main


main:


    lui $s2, ADDRHIGH
    lw $t0, TRISE($s2)
    andi $t0, $t0, 0xff82
    sw $t0, TRISE($s2)


    li $s3, 1 



while:

    lw $t0, LATE($s2)
    andi $t0, $t0, 0xff82
    sll $t1, $s3, 2
    or $t0, $t0, $t1
    sw $t0, LATE($s2)


    move $a0, $s3
    
    li $t0, 5
    sll $t0, 16
    ori $t0, $t0, 2

    move $a1,$t0
    li $v0, 6
    syscall

    li $a0, '\n'
    li $v0, 3
    syscall


    sll $s3, $s3, 1


if:


    ble $s3, 0x10, else

    li $s3, 1


else:


    li $a0, 434
    jal delay


    j while


    jr $ra




delay:

    mul $t0, $a0, 20000
    li $v0, 12
    syscall

wait:

    li $v0, 11
    syscall

    ble $v0, $t0, wait


    jr $ra
