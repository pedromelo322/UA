#include <detpic32.h>

void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= tempo){
    }

}

void send2displays(unsigned char value){

    static const char disp7Scodes[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x67, 0x77, 0x7c, 0x39, 0x5e, 0x79 ,0x71};

    LATD = (LATD & 0XFF9) | 0X0040;

    LATB = (LATB & 0x80ff) | (disp7Scodes[value >> 4] << 8);

    LATD = (LATD & 0XFF9) | 0X0020;

    LATB = (LATB & 0x80ff) | (disp7Scodes[value & 0x0F] << 8);

}



int main(void){

    TRISB = TRISB & 0x80ff;
    TRISD = TRISD & 0xff9f;

    while(1){

        send2displays(0x15);


        delay(0.2);

    }


    return 0;
}