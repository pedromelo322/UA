        .data        
        
        .equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
        .equ TRISD,0x60C0 # TRISB address is 0xBF886040
        .equ PORTD,0x60D0 # PORTB address is 0xBF886050
        .equ LATD,0x60E0 # LATB address is 0xBF886060
        .equ TRISE,0x6100 # TRISE address is 0xBF886100
        .equ PORTE,0x6110 # PORTE address is 0xBF886110
        .equ LATE,0x6120 # LATE address is 0xBF886120


        .text
        .globl main



main:


        lui $t1, ADDR_BASE_HI
        lw $t2, TRISE($t1) # Read TRISE
        andi $t2, $t2, 0xFFFE # RE0 -> saida
        sw $t2, TRISE($t1) # Write TRISE



        lw $t2, TRISD($t1) # Read TRISD
        ori $t2, $t2, 0x0100 # RD8 -> entrada
        sw $t2, TRISD($t1) #write TRISD



while:

        lw $t2, PORTD($t1)
        lw $t3, LATE($t1)


        andi $t2, $t2, 0x0100

        srl $t2, $t2, 8

        andi $t3, $t3, 0xFFFE

        or $t3, $t3, $t2

        sw $t3, LATE($t1)

        j while

        jr $ra


