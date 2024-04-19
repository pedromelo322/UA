#include <detpic32.h>


unsigned char tobcd(unsigned char value){
    return ((value / 10) << 4) + (value % 10);
}

void toDisplay(unsigned char valor){
    


    TRISB = TRISB & 0x80ff;
    TRISD = TRISD & 0xff9f;


    static const char disp7Scodes[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F};

    static unsigned char flag = 0x0001;

    unsigned char digit_high = disp7Scodes[valor >> 4];

    unsigned char digit_low = disp7Scodes[valor & 0x0F];

    if (flag == 1){
        LATD = (LATD & 0XFF9F) | 0X0040;
        LATB = (LATB & 0x80ff) | digit_high << 8;

    }else if(flag == 0){
        LATD = (LATD & 0XFF9F) | 0X0020;
        LATB = (LATB & 0x80ff) | digit_low  << 8;
    }

    flag = flag ^ 0x0001;
}



volatile unsigned char voltage = 0; // Global variable
int main(void)
{
unsigned int cnt = 0;


TRISBbits.TRISB4 = 1; // RBx digital output disconnected
AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
// mode an internal counter ends sampling and
// starts conversion
AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
// interrupt is generated. At the same time,
// hardware clears the ASAM bit
AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
AD1CON2bits.SMPI = 8-1; // Interrupt is generated after N samples
// (replace N by the desired number of
// consecutive samples)
AD1CHSbits.CH0SA = 4; // replace x by the desired input
// analog channel (0 to 15)
AD1CON1bits.ON = 1; // Enable A/D converter
// This must the last command of the A/D
// configuration sequence


// Configure all (digital I/O, analog input, A/D module)
// Configure interrupt system
IPC6bits.AD1IP = 2; // configure priority of A/D interrupts
IFS1bits.AD1IF = 0; // clear A/D interrupt flag
IEC1bits.AD1IE = 1; // enable A/D interrupts
EnableInterrupts(); // Global Interrupt Enable
while(1)
{
    resetCoreTimer();
    if(cnt == 0) // 0, 200 ms, 400 ms, ... (5 samples/second)
    {
        // Start A/D conversion
        AD1CON1bits.ASAM = 1; // Start conversion
    }
    while(readCoreTimer() < 200000){}
    
    // Send "voltage" value to displays
    toDisplay(voltage);
    cnt = (cnt + 1) % 20;
    // Wait ?? ms
}
return 0;
}
void _int_(27) isr_adc(void)
{
    // Read 8 samples (ADC1BUF0, ..., ADC1BUF7) and calculate average
    int *p = (int *)(&ADC1BUF0);
    int i, v;
    float av = 0.0;
    for (i = 0; i < 8; i++){
        av += p[i*4];
    }

    av = av / 8;
    // Calculate voltage amplitude

    v = (av * 33 + 511)/ 1023;

    // Convert voltage amplitude to decimal and store the result in the global variable "voltage"

    voltage = tobcd(v);

    // Reset AD1IF flag
    IFS1bits.AD1IF = 0; // Reset AD1IF flag
}