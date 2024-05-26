#include <detpic32.h>


void delay(float tempo){
    resetCoreTimer();
    tempo = PBCLK*tempo;
    while (readCoreTimer() < tempo);
}


void setPWM(unsigned int dutyCycle)
{
    // duty_cycle must be in the range [0, 100]
    if (dutyCycle >= 0 && dutyCycle <= 100){
        OC1RS = (dutyCycle*(PR3+1)/100); // Determine OC1RS as a function of "dutyCycle"
    }
}

int main(void){

    TRISCbits.TRISC14 = 0;

    T3CONbits.TCKPS = 2; // 1:32 prescaler (i.e. fout_presc = 625 KHz)
    PR3 = 49999; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Clear timer T2 count register
    T3CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1;// Use timer T3 as the time base for PWM generation
    setPWM(20);
    //OC1RS = 12500; 
    OC1CONbits.ON = 1; // Enable OC1 module

    EnableInterrupts();

    while (1)
    {

        printInt10(PORTDbits.RD0);
        LATCbits.LATC14 =  PORTDbits.RD0;
        
        delay(0.01);
    }
    


    return 0;

}