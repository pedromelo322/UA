#include <detpic32.h>

void delay(float tempo){
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

void intToBinarry(int value, char *string){

    int indx = 0;
    while(value != 0){
        string[indx] = (value % 2) + '0';
        value = value/2;
        indx++;
    }

    int start = 0, end = indx-1;
    char temp;

    while (start < end) {
        temp = string[start];
        string[start] = string[end];
        string[end] = temp;
        start++;
        end--;
    }

    // Adicionando o caractere nulo no final da string
    string[indx] = '\0';


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

    int counter = 0;
    char lista[4];


    while(1)
    {

        intToBinarry(counter, lista);
        putstring(lista);
        putc('\n');

        counter = (counter+1)%10;


        delay(0.2);
    }
    return 0;
}