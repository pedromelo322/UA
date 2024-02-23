#include <stdio.h>



int regra(int * array, int size){


    int num = 0;



    for (int i = 1; i < size-1; i++)
    {

        if (array[i] == array[i-1] + array[i+1]){
            num += 1;
        }

    }


    return num;
    
}



int main(int argc, char const *argv[])
{
    int array[10] = {1,2,3,4,5,6,7,8,9,10};

    int size = sizeof(array)/sizeof(int);


    printf("O número de elementos que obdecem á regra são %d", regra(array, size));



    return 0;
}
