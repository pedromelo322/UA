#include <detpic32.h>


void setPWM(int value){
    if (value >= 0 && value <= 0){
        OC1RS = ((PR3 + 1)/value)/100;
    }
}


int main(void)
{

    TRISB = TRISB | 0X0005;


    T3CONbits.TCKPS = 2; // 1:4 prescaler (i.e Fout_presc = 625 KHz)
    PR3 = 41666; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Reset timer T2 count register
    T3CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)
    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL =1;// Use timer T2 as the time base for PWM generation
    setPWM(75);
    OC1CONbits.ON = 1; // Enable OC1 module


    while(1){
        resetCoreTimer();

        int valor = LATB & 0X0005;

        if (valor == 0){
            setPWM(30);
        }else if(valor == 5){
            setPWM(55);
        }




        while(readCoreTimer() < (PBCLK * 0.00036));
    }

    return 0;
}



