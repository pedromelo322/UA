#include <detpic32.h>



void delay(float time_s){

    int tempo = PBCLK * time_s;
    resetCoreTimer();
    while(readCoreTimer() < tempo);

}



int main(void){


    TRISE = TRISE & 0xff80;
    TRISB = TRISB | 0x0004;

    int num = 0;



    while(1){

        num = num << 1;
        num = num & 0x007f;

        if (num == 0){
            num = 1;
        }

        LATE = (LATE & 0xff80) | num;

        if (PORTBbits.RB2 == 0){

            delay(1/3.0);

        }else{

            delay(1/7.0);

        }


    }


    return 0;
}
