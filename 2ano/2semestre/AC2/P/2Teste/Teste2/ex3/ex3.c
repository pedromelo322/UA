#include <detpic32.h>




void putc(char byte2send)
{
    // wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy byte2send to the UxTXREG register
    U2TXREG = byte2send;
}

void printstr(char *str){
    
    while(*str != '\0'){
        putc(*str);
        str++;
    }
}






volatile int counter = 15;


void _int_(32) isr_uart2(void){
    // Wait while URXDA == 0
    if(IFS1bits.U2RXIF == 1){
        while(U2STAbits.URXDA == 0);

        // Return UxRXREG
        char c;
        c = U2RXREG;



        if(c == 'U'){
            counter++;
            counter = counter % 16;
        }else if(c == 'R'){
            counter = 0;
            printstr("Reset\n");
        }

        LATE = (LATE & 0xff00) | (counter << 1);

        IFS1bits.U2RXIF = 0;
    }
}

int main(void)
{

    TRISE = TRISE & 0xffe1; 
    
    U2MODEbits.BRGH = 0;

    U2BRG = 130;

    U2MODEbits.PDSEL = 2;

    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;

    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    IPC8bits.U2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC1bits.U2RXIE = 1; // Enable timer T2 interrupts
    IFS1bits.U2RXIF = 0; // Reset timer T2 interrupt flag


    EnableInterrupts();


    while(1);

    return 0;
}



