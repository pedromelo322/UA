#include <detpic32.h>


void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;
    resetCoreTimer();

    while(readCoreTimer() < (int)tempo){
    }

}


int main(void){

    TRISE = TRISE & 0xFFC3;
    TRISB = TRISB | 0x0004;

    int counter = 0;

    while(1){


        if (PORTBbits.RB2 == 0){
            delay(1/2.3);
        }else{
            delay(1/5.2);
        }


        LATE = (LATE & 0xFFC3)| (counter << 2);



        counter += 1;

        counter = counter % 10;


    }

    return 0;

}