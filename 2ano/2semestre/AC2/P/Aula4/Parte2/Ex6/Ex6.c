#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= tempo){
    }

}



int main(void){


    TRISD = TRISD & 0xff9f;

    TRISB = TRISB | 0x000f;

    TRISB = TRISB & 0x80FF;

    LATD = (LATD & 0xffdf) |0x0020;


    char disp7Scodes[16] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x67, 0x77, 0x7c, 0x39, 0x5e, 0x79 ,0x71};

    while(1){
        int i = PORTB & 0x000f;
        LATB = (LATB & 0x80FF) | (disp7Scodes[i] << 8);
        delay(0.1);
    }

    return 0;
}