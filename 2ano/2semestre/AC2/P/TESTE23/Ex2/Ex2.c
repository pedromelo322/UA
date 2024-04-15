#include <detpic32.h>




void delay(float tempo_s){

    int tempo = PBCLK * tempo_s;

    resetCoreTimer();

    while(readCoreTimer() < tempo);


}

void send2display(unsigned char value){
    
    TRISB = TRISB & 0X80FF;
    TRISD = TRISD & 0xFFDF;

    static const char disp7decoder[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F}; 


    unsigned char digit_low = disp7decoder[value & 0x000f];


    LATD = (LATD & 0XFFDF) | 0x0020;
    LATB = (LATB & 0X80FF) | (digit_low << 8);

    

}






int main(void){

    TRISEbits.TRISE1 = 0;

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    // RBx digital output disconnected
    // RBx configured as analog input
    // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;
    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4;
    // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1;
    // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence


    int i;

    LATEbits.LATE1 = 0;

    


    while(1){



        AD1CON1bits.ASAM = 1;// Start conversion

        while( IFS1bits.AD1IF == 0 );// Wait while conversion not done
        LATEbits.LATE1 = !LATEbits.LATE1;


        int soma = 0;
        int *p = (int*)(&ADC1BUF0);        
        for(i = 0; i<2;i++){
            soma += p[i*4];
        }

        int valor = soma/2;

        printInt(valor, 16|3<<16);
        
        int v = (valor*9 + 511)/1023;
        
        
        send2display(v);


        putChar('\n');


        delay(0.2);

    }



    return 0;
}

