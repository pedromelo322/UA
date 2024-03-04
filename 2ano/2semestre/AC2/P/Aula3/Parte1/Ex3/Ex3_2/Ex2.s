
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
        lw $t2, TRISE($t1)
        andi $t2, $t2, 0xFFFE #Saida
        sw $t2, TRISE($t1)

        lw $t3, TRISD($t1)
        ori $t3, $t3, 0x0100 #Entrada
        sw $t3, TRISD($t1)




while:
        lw $t3, PORTD($t1)  #entrada
        lw $t2, LATE($t1)  #saida

        
        andi $t3, $t3, 0x0100
        xori $t3, $t3, 0x0100
        srl $t3, $t3, 8
        
        andi $t2, $t2, 0xFFFE


        or $t2, $t2, $t3


        sw $t2, LATE($t1)
        

        j while

        jr $ra


