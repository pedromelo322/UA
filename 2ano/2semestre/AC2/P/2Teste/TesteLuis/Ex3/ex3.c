#include <detpic32.h>


void putc(char byte2send)
{
// wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte2send;
// Copy byte2send to the UxTXREG register
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

    U2BRG = 520;

    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 1;

    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    IPC8bits.U2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC1bits.U2RXIE = 1; // Enable timer U2 interrupts
    IFS1bits.U2RXIF = 0; // Reset timer U2 interrupt flag


    TRISE = TRISE & 0xfff0;

    LATE = (LATE & 0xfff0) | counter;

    EnableInterrupts();


    counter = 0;
    
    while(1);


    return 0;
}




void _int_(32) isr_uart2(void){

    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);

    char c;
    c = U2RXREG;
    putc(c);
    if(c == 'F'){
        counter = (counter+1)%10;
        LATE = (LATE & 0xfff0) | counter;
    }
    else if(c == 'C'){
        counter = 0;
        LATE = (LATE & 0xfff0) | counter;
        printstr("VALOR MINIMO\n");
    }

    

    IFS1bits.U2RXIF = 0;
}