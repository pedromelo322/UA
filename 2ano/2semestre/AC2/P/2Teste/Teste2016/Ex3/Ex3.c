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


volatile static int flag = 0;

int main()
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

    U2BRG = 21;
    U2MODEbits.BRGH = 0;
    U2MODEbits.PDSEL = 2;
    U2MODEbits.STSEL = 0;
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;


    IPC8bits.U2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC1bits.U2RXIE = 1; // Enable timer T2 interrupts
    IFS1bits.U2RXIF = 0; // Reset timer T2 interrupt flag

    TRISB = TRISB | 0x000E;

    EnableInterrupts();

    while(flag == 0);


    return 0;
}


void _int_(32) isr_U2RX(void){


    char c;
    c = U2RXREG;
    if(c == 'L'){
        int valor = (PORTB & 0x000E) >> 1;
        putc(valor + '0');
    }else if(c == 'S'){
        printstr("Pedro");
    }else if(c == 'Q'){
        flag = 1;
    }

    
    IFS1bits.U2RXIF = 0; // Reset timer T2 interrupt flag
}