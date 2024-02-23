# Mapa de registos
# cc : $t0
# ms : $t1


            .data

str:        .asciiz "Teste-Pratico-1"

            .text
            .globl main


main:
            la $t1, str                      #ms = &str 

            

while:

	   lb $t2,0($t1)                    #*ms = str
            beq $t2,'\0', endwhile           #while(*ms != '\0')

            move $t0, $t2                    #cc = *ms

if:
            bge $t0, '0', else               #if (cc < 0)


            li $t2, '*'                      #*ms = '*'

            j endif

else:

if2:
            blt $t0, 'a', endif
            bgt $t0, 'z', endif
                                            #if (cc >= 'a' && cc <= 'z')

            addi $t2, $t2, -0x20            #*ms = *ms - 0x20

            

endif:

            sb $t2, 0($t1)                 #gravar o valor de $t2, em ms
            addi $t1, $t1, 1               #ms++

            j while                        #voltar ao loop


endwhile:

            li $v0, 0
            jr $ra
