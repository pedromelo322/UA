#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= tempo){
    }

}



int main(void){

    TRISE = TRISE & 0xFF87;

    int counter = 0;

    while(1){
        LATE = (LATE & 0xFF87) | counter << 3;

        delay(0.217);

        counter = (counter + 1) % 10;
    }

    return 0;
}
