#include <detpic32.h>


void setPWM(int value){
    if (value >= 0 && value <= 100){
        OC2RS = ((PR3+1)*value)/100;
    }
}

int main()
{
    T3CONbits.TCKPS = 2; // 1:4 prescaler (i.e Fout_presc = 625 KHz)
    PR3 = 41666; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Reset timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command of the
    // timer configuration sequence)
    OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC2CONbits.OCTSEL =1;// Use timer T3 as the time base for PWM generation
    setPWM(75);
    OC2CONbits.ON = 1; // Enable OC1 module


    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag


    TRISB = TRISB | 0x0005; 
    

    while(1){

        resetCoreTimer();

        int valor = PORTB & 0x0005;



        if (valor == 0){
            setPWM(30);
        }else if(valor == 5){
            setPWM(55);
        }

        printInt10(PORTDbits.RD1);

        while(readCoreTimer() < (PBCLK*0.00036));
    }


    return 0;
}
