#include <detpic32.h>


void delay(float tempo_s){
    
    int tempo = PBCLK * tempo_s;
    resetCoreTimer();
    while(readCoreTimer() <= tempo );
}


int main(void){


    TRISE = TRISE & 0xff03;
    TRISB = TRISB | 0x0005;

    int valor = 0x30;
    float time=1/7.3;


    while(1){

        LATE = (LATE & 0xff03) | valor << 2;


        if((PORTBbits.RB2 == 0) & (PORTBbits.RB0 == 0)){
            time = 1/4.6;

        }else if((PORTBbits.RB2 == 1) & (PORTBbits.RB0 == 1)){
            time = 1/7.3;
        }

        valor = valor >> 1;

        if (valor == 1){
            valor = 0x30;
        }



        delay(time);


    }





    return 0;
}