#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= tempo){
    }

}



int main(void){

    unsigned char segment;
    int i;

    TRISD = TRISD & 0xff9f;

    TRISB = TRISB & 0x80FF;

    LATD = (LATD & 0xffdf) |0x0040;

    while(1){
        segment = 1;
        for(i = 0; i < 7;i++){
            LATB = (LATB & 0x80FF) | (segment << 8);
            delay(0.5);
            segment = segment << 1;
        }

        LATD = LATD^0x0060;

    }

    return 0;
}