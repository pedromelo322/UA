#include <detpic32.h>


int tobcd(int value){
    return ((value/10) << 4) + (value % 10);
}


void send2displays(unsigned char value){

    TRISD = TRISD & 0xff9f;
    TRISB = TRISB & 0x80ff;

    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F,
    0x66, 0x6D, 0x7D, 0x07,
    0x7F, 0x6F, 0x77, 0x7C,
    0x39, 0x5E, 0x79, 0x71};

    static char displayFlag = 0; // variável não perde o valor entre chamadas à função (static)

    if (displayFlag == 0){
        LATDbits.LATD6 = 0;
        LATDbits.LATD5 = 1;
        LATB = (LATB & 0x80ff) | (display7Scodes[value & 0x0F] << 8);
    }
    else{
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80ff) | (display7Scodes[value >> 4] << 8);
    }

    displayFlag = !displayFlag;

}

volatile static int valor = 0;

int main(int argc, char const *argv[])
{

    T2CONbits.TCKPS = 2; // 1:4 prescaler (i.e. fout_presc = 120Hz)
    PR2 = 41666; // Fout = 20MHz / (4 * (62499 + 1)) = 10 Hz
    TMR2 = 0; // Clear timer T2 count register
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag



    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    float tempo = PBCLK*0.1;
    int i;

    EnableInterrupts();



    while(1){
        resetCoreTimer();

        AD1CON1bits.ASAM = 1; // Start conversion
        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        valor = 0;

        int *p = (int *)(&ADC1BUF0);
        for( i = 0; i < 2; i++ ) {
        valor += p[i*4];
        }

        valor = valor/2;
        valor = (valor*45+511)/1023 + 20;

        


        while(readCoreTimer() < tempo);
    }


    return 0;
}


void _int_(8) isr_T2(void) // Replace VECTOR by the timer T2
// vector number
{
    send2displays(tobcd(valor));
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag
}