#include <detpic32.h>

void setPWM(unsigned int dutyCycle){

    if (dutyCycle >= 0 && dutyCycle <= 100)
    {

        OC2RS = ((35713+1) * dutyCycle) / 100;
        return;
    }
}


int main()
{

    TRISB = TRISB | 0x0009; // configure RB0 to RB3 as digital output

    T2CONbits.TCKPS = 1; // 1:2 prescaler (i.e Fout_presc = 280 Hz)
    PR2 = 35713; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR2 = 0; // Reset timer T2 count register
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)
    OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC2CONbits.OCTSEL =0;// Use timer T2 as the time base for PWM generation
    setPWM(25); // Ton constant
    OC2CONbits.ON = 1; // Enable OC1 module
    int tempo = PBCLK*0.00025;

    while(1){

        resetCoreTimer();

        int valor = PORTB & 0x0009;
        
        if (valor == 1){
            setPWM(25);
        }else if(valor == 8){
            setPWM(70);
        }


        printInt10(PORTDbits.RD1);
        
        while (readCoreTimer() < tempo);

    }



    return 0;
}
