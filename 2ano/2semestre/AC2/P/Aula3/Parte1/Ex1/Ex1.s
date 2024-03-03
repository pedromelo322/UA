        .data        
        
        .equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
        .equ TRISB,0x6040 # TRISB address is 0xBF886040
        .equ PORTB,0x6050 # PORTB address is 0xBF886050
        .equ LATB,0x6060 # LATB address is 0xBF886060
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

        lw $t2, TRISB($t1) # Read TRISB
        ori $t2, $t2, 0x0001 # RB0 -> entrada
        sw $t2, TRISB($t1) #write TRISB



while:

        lw $t2, PORTB($t1)
        lw $t3, LATE($t1)


        andi $t2, $t2, 0x0001
        andi $t3, $t3, 0xFFFE

        or $t3, $t3, $t2


        sw $t3, LATE($t1)


        j while

        jr $ra


