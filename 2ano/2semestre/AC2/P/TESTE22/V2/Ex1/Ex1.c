#include <detpic32.h>


void delay(float tempo_s){

    int tempo = PBCLK * tempo_s;

    resetCoreTimer();

    while(readCoreTimer() < tempo);


}




int main(void)
{
    
    TRISE = TRISE & 0xFF03;
    TRISB = TRISB | 0x0005;
    float flag = 1/10.5;
    int valor=2;

    while(1){

        valor = (valor >> 1);
        if (valor == 1){
            valor = 0x0030;
        }

        LATE = (LATE & 0xFF03) | (valor << 2);


        if ((PORTBbits.RB2 == 0) & (PORTBbits.RB0 == 0)){
            flag = 1/3.5;
        }else if((PORTBbits.RB2 == 1) & (PORTBbits.RB0 == 1)){
            flag = 1/10.5;
        }

        delay(flag);


    }



    return 0;
}
