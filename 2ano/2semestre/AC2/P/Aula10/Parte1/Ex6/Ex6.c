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

char getc(void)
{
    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);
    // Return U2RXREG
    return U2RXREG;
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
        putc(getc());
    }
    return 0;
}