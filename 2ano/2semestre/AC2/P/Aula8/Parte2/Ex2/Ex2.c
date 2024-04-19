#include <detpic32.h>



void delay(float t){


    int tempo = PBCLK * t;
    resetCoreTimer();
    while(readCoreTimer() < tempo);

}


int main(void){

    TRISEbits.TRISE0 = 0;
    TRISDbits.TRISD8 = 1;

    IPC1bits.INT1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.INT1IE = 1; // Enable timer INT1 interrupts
    IFS0bits.INT1IF = 0; // Reset timer INT1 interrupt flag
    EnableInterrupts();

    while(1);

    return 0;
}

void _int_(7) isr_INT1(void){ 

    LATEbits.LATE0 = 1;
    delay(3);
    LATEbits.LATE0 = 0;

    IFS0bits.INT1IF = 0;

}