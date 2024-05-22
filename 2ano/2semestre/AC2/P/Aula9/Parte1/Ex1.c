#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= (int)tempo){
    }

}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value){

    TRISB = TRISB & 0x80ff;
    TRISD = TRISD & 0xff9f;


    static const char disp7Scodes[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F};

    static unsigned char flag = 0x0001;

    unsigned char digit_high = disp7Scodes[value >> 4];

    unsigned char digit_low = disp7Scodes[value & 0x0F];

    if (flag == 1){
        LATD = (LATD & 0XFF9F) | 0X0040;
        LATB = (LATB & 0x80ff) | digit_high << 8;

    }else if(flag == 0){
        LATD = (LATD & 0XFF9F) | 0X0020;
        LATB = (LATB & 0x80ff) | digit_low  << 8;
    }

    flag = flag ^ 0x0001;
    

}

volatile int voltage = 0; // Global variable

int main(void){

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    TRISDbits.TRISD11 = 0;
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 8-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    T1CONbits.TCKPS = 2; // 1:64 prescaler (i.e Fout_presc = 625 KHz)
    PR1 = 62499; // Fout = 20MHz / (64 * (62499 + 1)) = 10 Hz
    TMR1 = 0; // Reset timer T2 count register
    T1CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC1bits.T1IP = 1; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts    
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag

    T3CONbits.TCKPS = 2; // 1:4 prescaler (i.e Fout_presc = 625 KHz)
    PR3 = 49999; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR3 = 0; // Reset timer T2 count register
    T3CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 3; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag

    IPC6bits.AD1IP = 5; // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts

    EnableInterrupts();

    

    while(1);

    return 0;
}


void _int_(4) isr_T1(void)
{
    
    AD1CON1bits.ASAM = 1;

    IFS0bits.T1IF = 0;

}

void _int_(12) isr_T3(void)
{
// Send the value of the global variable "voltage" to the displays
// using BCD (decimal) format

    send2displays(toBcd(voltage));

    IFS0bits.T3IF = 0;
}

void _int_(27) isr_adc(void) // Replace VECTOR by the A/D vector
// number - see "PIC32 family data
// sheet" (pages 74-76)
{
// Read conversion result (ADC1BUF0) and print it

    int soma, i, avg;

    soma = 0;
    int *p = (int *)(&ADC1BUF0);
    for( i = 0; i < 8; i++ ) {
    soma += p[i*4];
    }


    avg = soma/8;

    voltage = (avg * 33 +511)/1023;

    IFS1bits.AD1IF = 0;
}