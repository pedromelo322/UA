#include <detpic32.h>



void putc(char byte2send)
{
// wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte2send;

// Copy byte2send to the UxTXREG register
}


volatile static int counter;


int main(void)
{

    /*
    1) Configurar o gerador de baudrate de acordo com a taxa de transmissão/receção
    pretendida (registo UxBRG e bit BRGH do registo UxMODE).
    2) Configurar os parâmetros da trama: dimensão da palavra a transmitir (número de data
    bits) e tipo de paridade (bits PDSEL<1:0> do registo UxMODE); número de stop bits (bit
    STSEL do registo UxMODE).
    3) Ativar os módulos de transmissão e receção (bits UTXEN e URXEN do registo UxSTA).
    4) Ativar a UART (bit ON do registo UxMODE).

*/


    U2BRG = 32;

    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 1;

    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;

    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    IPC8bits.U2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC1bits.U2RXIE = 1; // Enable timer T2 interrupts
    IFS1bits.U2RXIF = 0; // Reset timer T2 interrupt flag

    TRISE = TRISE & 0XFFC3;

    counter = 0;

    

    EnableInterrupts();

    while(1){
        LATE = (LATE & 0XFFC3) | (counter << 2);
    }

    return 0;
}



void _int_(32) isr_U2RX(void){

    char c;
    c = U2RXREG;
    putc(c);
    if(c == 'D'){
        counter = (counter - 1) % 16;
    }
    else if(c == 'R'){
        counter = 0;
    }
    IFS1bits.U2RXIF = 0; // Reset timer T2 interrupt flag
}




