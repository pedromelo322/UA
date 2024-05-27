#include <detpic32.h>


void putc(char byte2send)
{
// wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
// Copy byte2send to the UxTXREG register
    U2TXREG = byte2send;
}

void printstr(char *value){
    while(*value != '\0'){
        putc(*value);
        value++;
    }
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
    IEC1bits.U2RXIE = 1; // Enable timer U2RX interrupts
    IFS1bits.U2RXIF = 0; // Reset timer U2RX interrupt flag

    counter = 0;

    TRISE = TRISE & 0xFFC3;

    EnableInterrupts();

    

    while(1){}

    return 0;
}



void _int_(32) isr_U2RX(void){


    char c;
    c = U2RXREG;
    if(c == 'D'){
        counter = (counter - 1)%16;
    }
    else if(c == 'R'){
        counter = 15;
        printstr("MAXIMO");
    }
    LATE = (LATE & 0xFFC3) | (counter << 2);

    IFS1bits.U2RXIF = 0; // Reset timer U2RX interrupt flag
}