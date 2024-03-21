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
    AD1CON2bits.SMPI = 4-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    int V=0, i=0, soma, avg, j;

    while(1){

        

        if(i == 0){ // 0, 200ms, 400ms, 600ms, ...
            AD1CON1bits.ASAM = 1;
            

            while( IFS1bits.AD1IF == 0 );


            soma = 0;
            int *p = (int *)(&ADC1BUF0);
            for( j = 0; j < 4; j++ ) {
            soma += p[j*4];
            }

            

            avg = soma/4;

            IFS1bits.AD1IF = 0;
        }

        V = (avg * 33 +511)/1023;
        send2displays(toBcd(V));
        putChar('\r');
        printInt(ADC1BUF0, 10 | 4 << 16);

        delay(0.01);
        i = (i+1) % 20;

        
    }

    return 0;
}
