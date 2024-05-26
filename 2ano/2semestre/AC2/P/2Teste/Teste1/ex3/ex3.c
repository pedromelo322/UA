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


void _int_ (32) isr_uart2(void){

    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);


    char c;
    c = U2RXREG;
    if(c == 'P'){
        printstr("DipSwitch=");

        putc(PORTBbits.RB3 + '0');
        putc(PORTBbits.RB2 + '0');
        putc(PORTBbits.RB1 + '0');
        putc(PORTBbits.RB0 + '0');

        putc('\n');
    }
    else if(c == 'T'){

        LATEbits.LATE4 = !LATEbits.LATE4;

    }


    IFS1bits.U2RXIF = 0; // Reset UART2 interrupt flag
} 


int main(void)
{

    /*
    1) Configurar o gerador de baudrate de acordo com a taxa de transmissão/receção
    pretendida (registo UxBRG e bit BRGH do registo UxMODE).

    2) Configurar os parâmetros da trama: dimensão da palavra a transmitir (número de data
    bits) e tipo de paridade (bits PDSEL<1:0> do registo UxMODE); número de stop bits (bit
    STSEL do registo UxMODE).

    3) Ativar os módulos de transmissão e receção (bits UTXEN e URXEN do registo UxSTA).
    4) Ativar a UART (bit ON do registo UxMODE).*/


    U2BRG = 130;

    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 2;

    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;


    IPC8bits.U2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC1bits.U2RXIE = 1; // Enable UART2 interrupts
    IFS1bits.U2RXIF = 0; // Reset UART2 interrupt flag

    TRISB = TRISB | 0x000F;
    TRISEbits.TRISE4 = 0;
    LATEbits.LATE4 = 1;

    EnableInterrupts();

    while(1);
    
    return 0;
}


