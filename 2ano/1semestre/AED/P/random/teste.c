#include <stdio.h>

double sqrt(double val)
{
    double aux, xn = 1.0;
    int i = 0;
    if(val > 0.0)
    {
        do
        {
            aux = xn;
            xn = 0.5 * (xn + val/xn);
        } while((aux != xn) && (++i < 25));
    } else
        xn = 0.0;
    return xn;
}

int main() {
    double val = 5.3;
    double result = sqrt(val);
    printf("The square root of %.1f is %.2f\n", val, result);
    return 0;
}