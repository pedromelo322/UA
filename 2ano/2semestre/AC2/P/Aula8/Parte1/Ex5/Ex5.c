#include <detpic32.h>

int main(void)
{

    TRISD = TRISD & 0xFFFA; 
    LATD = LATD & 0xFFFA;


    
    T3CONbits.TCKPS = 4; // 1:16 prescalar
    PR3 = 49999; // Fout = 20MHz / (16 * (x + 1)) = 25 Hz
    TMR3 = 0; // Clear timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag

    T1CONbits.TCKPS = 2; // 1:64 prescalar
    PR1 = 62499; // Fout = 20MHz / (64 * (x + 1)) = 5 Hz
    TMR1 = 0; // Clear timer T3 count register
    T1CONbits.TON = 1; // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    IPC1bits.T1IP = 4; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag
    // Configure Timer T3 with interrupts enabled
    EnableInterrupts();
    while(1);
    return 0;
}

void _int_(4) isr_T1(void)
{
    LATDbits.LATD0 =! LATDbits.LATD0;

    IFS0bits.T1IF = 0;
// print character '1'
// Reset T1IF flag
}
void _int_(12) isr_T3(void)
{
    LATDbits.LATD2 =! LATDbits.LATD2;

    IFS0bits.T3IF = 0;
// print character '3'
// Reset T3IF flag
}