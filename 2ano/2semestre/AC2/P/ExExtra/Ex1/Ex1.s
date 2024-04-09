.data

.equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
.equ TRISB,0x6040 # TRISE address is 0xBF886100
.equ PORTB,0x6050 # PORTE address is 0xBF886110
.equ LATB,0x6060 # LATE address is 0xBF886120
.equ TRISE,0x6100 # TRISE address is 0xBF886100
.equ PORTE,0x6110 # PORTE address is 0xBF886110
.equ LATE,0x6120 # LATE address is 0xBF886120


.text
.globl main



main:

    lui $s1, ADDR_BASE_HI
    lw $t0, TRISB($s1)
    ori $t0, $t0, 0x000F
    sw $t0, TRISB($s1)
    lw $t0, TRISE($s1)
    andi $t0, $t0, 0xFFF0
    sw $t0, TRISE($s1)


loop:

    lw $t0, PORTB($s1)
    andi $s2, $t0, 0x000F

    lw $t0, LATE($s1)
    andi $s3, $t0, 0xFFF0

    or $s4, $s3, $s2

    sw $s4,LATE($s1)

    
    j loop


    