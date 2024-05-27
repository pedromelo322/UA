#include <detpic32.h>


int tobcd(int value){
    return ((value / 10) << 4) + (value%10);
}



void send2display(int value){


    static const char segdecoder[] = {0x3F, 0x06, 0x5B, 0x4F,
    0x66, 0x6D, 0x7D, 0x07,
    0x7F, 0x6F, 0x77, 0x7C,
    0x39, 0x5E, 0x79, 0x71};

    static int flag = 0;

    if (flag == 0){
        LATDbits.LATD6 = 1;
        LATDbits.LATD5 = 0;
        LATB = (LATB & 0x80ff) | (segdecoder[value >> 4] << 8);
    }else{
        LATDbits.LATD6 = 0;
        LATDbits.LATD5 = 1;
        LATB = (LATB & 0x80ff) | (segdecoder[value & 0x0f] << 8);
    }

    flag = !flag;


}


volatile static int soma;

int main()
{



    TRISD = TRISD & 0xff9f;
    TRISB = TRISB & 0x80ff;


    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    T5CONbits.TCKPS = 4; // 1:16 prescaler (i.e. fout_presc = 625 KHz)
    PR5 = 49999; // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR5 = 0; // Clear timer T5 count register
    T5CONbits.TON = 1; // Enable timer T5 (must be the last command of the
    // timer configuration sequence)

    IPC5bits.T5IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T5IE = 1; // Enable timer T5 interrupts
    IFS0bits.T5IF = 0; // Reset timer T5 interrupt flag

    IPC6bits.AD1IP = 4; // Interrupt priority (must be in range [1..6])
    IEC1bits.AD1IE = 1; // Enable timer T5 interrupts
    IFS1bits.AD1IF = 0; // Reset timer T5 interrupt flag
    

    EnableInterrupts();

    while(1){

        resetCoreTimer();


        send2display(tobcd(soma));

        while(readCoreTimer() < (PBCLK * (1.0/150)));
        
    }


    return 0;
}


void _int_(20) isr_T5(void){


    AD1CON1bits.ASAM = 1; // Start conversion

    IFS0bits.T5IF = 0; // Reset timer T5 interrupt flag
}


void _int_(27) isr_AD1(void){


    int i;
    soma = 0;

    int *p = (int *)(&ADC1BUF0);
    for (i=0; i<4; i++){
        soma += p[i*4];
    }

    soma = soma/4;

    soma = (soma*20 +511)/1023+5;


    IFS1bits.AD1IF = 0; // Reset timer T5 interrupt flag
}