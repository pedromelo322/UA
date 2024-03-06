#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= tempo){
    }

}

int main(void){
    TRISCbits.TRISC14 = 0;


    while(1){
        delay(0.5);
        LATCbits.LATC14 = !LATCbits.LATC14;
    }

    
}


