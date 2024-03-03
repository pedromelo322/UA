        .data

        .equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
        .equ TRISB,0x6040 # TRISB address is 0xBF886040
        .equ PORTB,0x6050 # PORTB address is 0xBF886050
        .equ LATB,0x6060 # LATB address is 0xBF886060
        .equ TRISD,0x60C0 # TRISE address is 0xBF88060C0
        .equ PORTD,0x60D0 # PORTE address is 0xBF88060D0
        .equ LATD,0x60E0 # LATE address is 0xBF88060E0


        .text
        .globl main



main:


        lui $t1, ADDR_BASE_HI
        lw $t2,TRISD($t1)       
        andi $t2, $t2, 0XFFFE   #saida
        sw $t2, TRISD($t1)


        lw $t3,TRISB($t1)       
        andi $t3, $t2, 0XFFFE   #entrada
        sw $t3, TRISB($t1)


while:

        lw $t3, PORTB($t1)
        lw $t2, LATD($t1)

        andi $t3, $t3, 0x0001
        xori $t3, $t3, 0x0001
        andi $t2, $t2, 0XFFFE

        or $t2, $t2, $t3

        sw $t2, LATD($t1)


        j while

        jr $ra