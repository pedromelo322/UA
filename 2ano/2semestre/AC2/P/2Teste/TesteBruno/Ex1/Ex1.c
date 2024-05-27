#include <detpic32.h>


void setPWM(int value){
    if (value >= 0 && value <= 100){    
        OC4RS = (PR3+1)*value/100;
    }
    
}



int main(void)
{

    T3CONbits.TCKPS = 1; // 1:2 prescaler (i.e Fout_presc = 625 KHz)
    PR3 = 35714; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Reset timer T2 count register
    T3CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)
    OC4CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC4CONbits.OCTSEL =1;// Use timer T2 as the time base for PWM generation
    setPWM(10);
    OC4CONbits.ON = 1; // Enable OC1 module

    TRISB = TRISB | 0X000A;

    int value;


    while(1){

        resetCoreTimer();

        value = PORTB & 0X000A;


        if (value == 8){
            setPWM(60);
        }else if(value == 2){
            setPWM(10);
        }

        printInt10(PORTDbits.RD3);


        while(readCoreTimer() < PBCLK * 0.00015);

    }
    
    return 0;
}
