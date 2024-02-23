
# i   : $t0
# max1: $t1
# max2: $t2


            .data 

            .eqv size, 5

array:      .word 5,27,3,11,56

            .text
            .globl main


main:
            li $t0,0                #int i
            li $t1,0                #int max1
            li $t2,0                #int max2


	    li $t7, 1
            sll $t1, $t7, 31
            move $t2, $t1


            li $t0, 0               # i = 0
            la $t3, array           # $t3 = &array[0]
            
for:        
            bge $t0, size, endfor   # i < size

            sll $t4, $t0, 2         # $t4 = (i*4)

            addu $t4,$t3,$t4        # &array[i] = &array[0] + (i*4)

            lw $t5,0($t4)           # array[i] 


if:        

            ble $t5, $t1,else      #if (array[i] > max1)
            move $t2, $t1           # max2 = max1
            
            move $t1, $t5           # max1 = array[i]

            j endif

else:    

if2:        
            ble $t5, $t2, endif      
            bge $t5, $t1, endif
                                    #if (array[i] > max2 && array[i] < max1)
                    
            move $t2, $t5           # max2 = array[i]

endif:


            addi $t0, $t0, 1        # i++
            j for                   # voltar ao loop for
endfor:
            li $v0, 0
            jr $ra