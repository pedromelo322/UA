#include <detpic32.h>



void delay(float t){


    int tempo = PBCLK * t;
    resetCoreTimer();
    while(readCoreTimer() < tempo);

}


int main(void){

    TRISEbits.TRISE0 = 0;
    TRISDbits.TRISD8 = 1;

    while(1){
        if (PORTDbits.RD8 == 0){
            LATEbits.LATE0 = 1;
            delay(3);
            LATEbits.LATE0 = 0;
        }
    }

    return 0;
}