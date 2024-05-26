#include <detpic32.h>



void setPWM(int value){
    if (value >= 0 && value <= 100){
        OC2RS = ((PR2+1)*value)/100;
    }
}



int main(void)
{


    T2CONbits.TCKPS = 2; // 1:4 prescaler (i.e Fout_presc = 150 Hz)
    PR2 = 33333; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR2 = 0; // Reset timer T2 count register
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)
    OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC2CONbits.OCTSEL = 0;// Use timer T2 as the time base for PWM generation
    setPWM(25);
    OC2CONbits.ON = 1; // Enable OC1 module

    EnableInterrupts();

    float tempo = PBCLK * 0.00025;

    int valor;

    while(1){

        resetCoreTimer();

        valor = PORTB & 0x0009;

        if (valor == 1){
            setPWM(25);
        }else if(valor == 8){
            setPWM(70);
        }


        printInt10(PORTDbits.RD1);


        while(readCoreTimer() < tempo);

    }


    return 0;
}


