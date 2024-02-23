int main(void){
    int counter10 = 0;
    int counter5;
    int counter1;
    while(1){
        putChar('\r'); // cursor regressa ao inicio da linha no ecrã
        counter1 = counter10 / 10;
        printInt(counter1, 10 | 4 << 16); // Ver nota de rodapé 1
        putChar('\t');
        counter5 = counter10 / 2;
        printInt(counter5, 10 | 4 << 16);
        putChar('\t');
        printInt(counter10, 10 | 4 << 16);


        
        resetCoreTimer();
        while(readCoreTimer() < 2000000);
        counter10++;
    }
    return 0;
}



//1MHz = 1000000Hz


//1Hz = 20MHz/20000000
//5Hz = 20MHz/4000000
//10Hz = 20MHz/2000000


