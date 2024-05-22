#include <detpic32.h>

void delay(int tempo){
    resetCoreTimer();
    tempo = PBCLK*tempo;
    while (readCoreTimer() < tempo);
}


void putc(char byte)
{

    while(U2STAbits.UTXBF == 1);


    // wait while UART2 UTXBF == 1
    // Copy "byte" to the U2TXREG register

    U2TXREG = byte;
}

void putstring(char *str)
{
// use putc() function to send each charater ('\0' should notbe sent)

    while(*str != '\0'){
        putc(*str);
        str++;
    }
}



int main(void)
{
    // Configure UART2:
    // 1 - Configure BaudRate Generator

    U2BRG = 42;
    U2MODEbits.BRGH = 1;

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)

    U2MODEbits.PDSEL=0;
    U2MODEbits.STSEL=00;

    // 3 – Enable the trasmitter and receiver modules (see register U2STA)

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;



    while(1)
    {
        putstring("String de teste\n");
        // wait 1 s
        delay(1);
    }
    return 0;
}