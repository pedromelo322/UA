        .data


        .equ resetCoreTimer, 12
        .equ readCoreTimer, 11



        .text
        .globl timeDone


timeDone:



        move $t1, $a0   #ms
        move $t2, $a1   #reset


        li $t3,0    #curCount
        li $t4, 0   #retValue
        li $t5, 20000



if: 

        ble $t2, 0, else

        li $v0, resetCoreTimer
        syscall

        j endif



else:

        li $v0, readCoreTimer
        syscall

        move $t3, $v0

if2:
        
        mul $t0, $t5, $t1
        ble $t3, $t0, endif

        div $t3, $t5
        mflo $t4

endif:

        move $v0, $t4

        jr $ra