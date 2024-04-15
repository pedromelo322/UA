#include <detpic32.h>

void delay(float tempo_s){

    int tempo = PBCLK * tempo_s;
    resetCoreTimer();
    while(readCoreTimer()<=tempo);

}

void send2display(unsigned char valor){

    unsigned const char bin7dec[]={
            0x3F, // 0
            0X06, // 1
            0x5B, //2
            0x4F, //3
            0x66, //4
            0x6D, //5
            0x7D, //6
            0x07, //7
            0x7F, //8
            0x6F, //9
            0x77, //A
            0x7C, //b
            0x39, //C
            0x5E, //d
            0x79, //E
            0x71  //F
        };

    LATD = (LATD & 0xff9f) | (0x0020);

    LATB = (LATB & 0x80ff) | (bin7dec[valor] << 8);
    

    

}



int main(void)
{

    TRISD = TRISD & 0xff9f;
    TRISB = TRISB & 0x80ff;
    TRISEbits.TRISE1 = 0;

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

    int i,media, v;
    LATEbits.LATE1 = 0;

    while(1){

        media = 0;

        AD1CON1bits.ASAM = 1; // Start conversion
        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done
        LATEbits.LATE1 =!LATEbits.LATE1;


        int *p = (int*)(&ADC1BUF0);
        for (i=0; i<2;i++){
            media += p[i*4];
        }

        media = media/2;

        printInt(media,16|3<<16);
        putChar('\r');


        v = (media * 9 + 511)/1023;

        send2display(v);

        delay(1/5.0);

    }
    
    return 0;


}    
