#include <detpic32.h>



int main(void){

    TRISB = TRISB & 0x80ff;
    TRISD = TRISD & 0xff9f;

    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 1;
    char c;
    while(1){
        printf("char:");
        c = getChar();
        printf(" %c \n", c);
        if(c == 'a')  LATB = (LATB & 0x80FF) | 0x0100;
        if(c == 'b')  LATB = (LATB & 0x80FF) | 0x0200;
        if(c == 'c')  LATB = (LATB & 0x80FF) | 0x0400;
        if(c == 'd')  LATB = (LATB & 0x80FF) | 0x0800;
        if(c == 'e')  LATB = (LATB & 0x80FF) | 0x1000;
        if(c == 'f')  LATB = (LATB & 0x80FF) | 0x2000;
        if(c == 'g')  LATB = (LATB & 0x80FF) | 0x4000;
    }

    return 0;
}