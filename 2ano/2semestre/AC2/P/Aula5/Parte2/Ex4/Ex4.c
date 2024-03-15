#include <detpic32.h>

void delay(float tempo_s){

    float tempo = PBCLK*tempo_s;

    resetCoreTimer();

    while(readCoreTimer() <= (int)tempo){
    }

}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value){

    static const char disp7Scodes[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F};

    static unsigned char flag = 0x0001;

    unsigned char digit_high = disp7Scodes[value >> 4];

    unsigned char digit_low = disp7Scodes[value & 0x0F];

    if (flag == 1){
        LATD = (LATD & 0XFF9F) | 0X0040;
        LATB = (LATB & 0x80ff) | digit_high << 8;

    }else if(flag == 0){
        LATD = (LATD & 0XFF9F) | 0X0020;
        LATB = (LATB & 0x80ff) | digit_low  << 8;
    }

    flag = flag ^ 0x0001;
    

}



int main(void){

    TRISB = TRISB & 0x80ff;
    TRISD = TRISD & 0xff9f;
    TRISB = TRISB | 0x0001;
    TRISC = TRISC & 0xBfff;

    char counter = 0x00;
    unsigned int i = 0;
    int flagLed = 0;

    while(1){


        send2displays(toBcd(counter));

        delay(0.01);

        if (PORTBbits.RB0 == 1){

            i = (i+1) % 20; //5hz inc

            if (i == 0){

            
            if (counter == 60){
                counter = 0;
                flagLed = 1;
            }

            counter += 1;

            }
        }else{

            i = (i+1) % 50; //2hz dec

            if (i == 0){

            
            if (counter == 0){
                counter = 60;
                flagLed = 1;
            }

            counter -= 1;

            }

        }


        if (flagLed != 0){

            LATCbits.LATC14 = 1;

            flagLed += 1;

            if (flagLed == 501){
                flagLed = 0;
                LATCbits.LATC14 = 0;
            } 

        }

    }


    return 0;
}
