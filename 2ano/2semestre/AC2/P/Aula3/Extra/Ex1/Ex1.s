        .data

        .equ ADDR_BASE_HI, 0xBF88
        .equ TRISB, 0x6040
        .equ PORTB, 0x6050
        .equ LATB, 0x6060
        .equ TRISE, 0x6100
        .equ PORTE, 0x6110
        .equ LATE, 0x6120

        .text
        .globl main


main:

        lui $s1, ADDR_BASE_HI
        lw $t0, TRISB($s1)
        ori $t0, $t0, 0x000F
        sw $t0, TRISB($s1)

        lui $s1, ADDR_BASE_HI
        lw $t0, TRISE($s1)
        andi $t0, $t0, 0xFFC3
        sw $t0, TRISE($s1)


while:

        li $t3, 0

        lw $t0, PORTB($s1)
        andi $t2, $t0, 0x000F

        #--------------------

        andi $t0, $t2, 0x0001

        xori $t0, $t0, 0x0001

        sll $t0, $t0, 2

        or $t3, $t3, $t0


        #--------------------

        andi $t0, $t2, 0x0002



        sll $t0, $t0, 2

        or $t3, $t3 , $t0

                
        #--------------------

        andi $t0, $t2, 0x0004

        sll $t0, $t0, 2

        or $t3, $t3 , $t0

        #--------------------

        andi $t0, $t2, 0x0008

        xori $t0, $t0, 0x0008

        sll $t0, $t0, 2

        or $t3, $t3 , $t0

        

        #---------------------


        lw $t0, PORTE($s1)

        andi $t0 ,$t0, 0xFFC3

        or $t0, $t3, $t0 

        sw $t0, PORTE($s1)














        j while





        jr $ra