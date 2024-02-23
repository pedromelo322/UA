#include <stdio.h>


int fact(int *v){

    int temp = 1;
    
    for (size_t i = 2; i < *v; i++)
    {

        temp *= i;

    }

    *v = temp;

    return 0;
}





int printValores(int *a, int *b, int *c){

    printf("a: %d\nb: %d\nc: %d\n", *a, *b, *c);

    return 0;

}


int main(int argc, char const *argv[])
{
    int a = 3;

    int b = 6;

    int c = 9; 

    printValores(&a, &b, &c);

    fact(&a);
    fact(&b);
    fact(&c);

    printValores(&a, &b, &c);


    return 0;
}
