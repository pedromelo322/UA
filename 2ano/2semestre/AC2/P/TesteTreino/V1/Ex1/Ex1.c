#include <detpic32.h>



void delay(float tempo_s){

    int tempo = PBCLK * tempo_s;
    resetCoreTimer();
    while(readCoreTimer() <= tempo);


}



int main(void){

    TRISE = TRISE & 0xff03;
    TRISB = TRISB | 0x0005;
    int valor = 0x0001;
    float time=0;





    while(1){

        if (valor == 0x0001){
            valor = 0x0030;
        }

        LATE = (LATE & 0XFF03) | (valor << 2);


        if ((PORTBbits.RB2 == 1) & (PORTBbits.RB0 == 1)){
            time = 1/7.3;
        } else if((PORTBbits.RB2 == 0) & (PORTBbits.RB0 == 0)){
            time = 1/4.6;
        }

        valor = valor >> 1;

        delay(time);


    }
}
