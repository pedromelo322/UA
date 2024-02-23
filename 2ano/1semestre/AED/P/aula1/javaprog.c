#include <stdio.h>

void cumSum(int a[], int b[], int tamanho) {
    int c = 0;
    for (int i=0; i < tamanho; i++) 
    {
        c += a[i];
        b[i] = c;
    }
}

void printArray(char s[], int a[], int tamanho){
    printf("%s :\n", s);
    for (int i = 0; i < tamanho; i++)
    {
        printf("%d ",a[i]);
    }
    puts("");
}

int main(int argc, char const *argv[])
{
    int a[] = {31,28,31,30,31,30,31,31,30,31,30,31};
    int tamanho = sizeof(a) / sizeof(a[0]);
    printArray("a", a, tamanho);
    int b[12];
    cumSum(a, b, tamanho);
    printArray("b", b, 12);
    return 0;
}
