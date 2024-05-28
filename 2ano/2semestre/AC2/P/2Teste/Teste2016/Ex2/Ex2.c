#include <detpic32.h>


int tobcd(int value){
    return (((value / 10)<<4) + (value%10));
}


void send2display(int value){



    const static char segDecoder[] = {0x3F, 0x06, 0x5B, 0x4F,
    0x66, 0x6D, 0x7D, 0x07,
    0x7F, 0x6F, 0x77, 0x7C,
    0x39, 0x5E, 0x79, 0x71};


    static int flag = 0;

    if (flag == 0){

        LATDbits.LATD6 = 1;
        LATDbits.LATD5 = 0;
        LATB = (LATB &  0X80FF) | (segDecoder[value >> 4] << 8);

    }else if(flag == 1){

        LATDbits.LATD6 = 0;
        LATDbits.LATD5 = 1;
        LATB = (LATB &  0X80FF) | (segDecoder[value & 0x0f] << 8);

    }


    flag = !flag;

}


volatile static int valor;


int main(void)
{

    TRISD = TRISD & 0XFF9F;
    TRISB = TRISB & 0X80FF;

    
    TRISBbits.TRISB4 = 1; // RB4 digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RB4 configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 1-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace 4 by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence


    T2CONbits.TCKPS = 0; // 1:1 prescaler (i.e. fout_presc = 625 KHz)
    PR2 = 49999; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR2 = 0; // Clear timer T2 count register
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag

    EnableInterrupts();

    while(1){

        resetCoreTimer();


        AD1CON1bits.ASAM = 1; // Start conversion

        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);
        int i;
        valor = 0;
        for (i=0; i<1;i++){
            valor += p[i*4];
        }

        valor = (valor*70+511)/1023;

        while(readCoreTimer() < (PBCLK * (1.0/50)));


    }

    return 0;
}


void _int_(8) isr_T2(void){


    send2display(tobcd(valor));


    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag   
}
