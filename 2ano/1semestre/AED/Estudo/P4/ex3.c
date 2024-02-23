#include <stdio.h>
#include <assert.h>



size_t NUM_COMPS;

void dysplayArray(int * array, int size){

    

    for (int i = 0; i < size; i++)
    {
        printf("[");
        printf("%d", array[i]);
        printf("]");
    }

}

void printTabela(int v){


    printf("    [Resultado][%d]   [Nº de operações][%d]\n",v,NUM_COMPS);


}

int check(int* array, int size){

    assert(size > 2);

    int count = 0;

    for (int k = 2; k < size; k++)
    {

        for (int j = 0; j < k; j++)
        {
            for (int i = 0; i < j; i++)
            {

                if (array[k] == array[i] + array[j]){
                    count += 1;
                }

                NUM_COMPS ++;
            }
            
        }
        
        
    }

    return count;
    
}



int main(int argc, char const *argv[])
{

    int size;


    int array1[10] = {1,2,3,4,5,6,7,8,9,10};
    int array2[20] = {1,2,4,4,5,6,7,8,9,10}; 
    int array3[20] = {1,2,4,8,5,6,7,8,9,10,1,2,4,8,16,6,7,8,9,10}; 
    int array5[10] = {0,0,0,0,0,0,0,0,0,0}; 
    int array6[5]  = {0,2,2,0,3}; 
    int array7[15] = {1,2,1,3,2,6,7,8,9,10,3,0,4,4,0}; 
    int array8[10] = {1,2,1,4,5,6,7,8,9,10}; 
    int array9[10] = {1,2,3,4,5,6,7,8,9,10};
    

    NUM_COMPS = 0;
    size = sizeof(array1)/sizeof(int);
    dysplayArray(array1, size);
    printTabela(check(array1, size));

    NUM_COMPS = 0;
    size = sizeof(array2)/sizeof(int);
    dysplayArray(array2, size);
    printTabela(check(array2, size));


    NUM_COMPS = 0;
    size = sizeof(array3)/sizeof(int);
    dysplayArray(array3, size);
    printTabela(check(array3, size));


    NUM_COMPS = 0;
    size = sizeof(array5)/sizeof(int);
    dysplayArray(array5, size);
    printTabela(check(array5, size));


    NUM_COMPS = 0;
    size = sizeof(array6)/sizeof(int);
    dysplayArray(array6, size);
    printTabela(check(array6, size));


    NUM_COMPS = 0;
    size = sizeof(array7)/sizeof(int);
    dysplayArray(array7, size);
    printTabela(check(array7, size));

    NUM_COMPS = 0;
    size = sizeof(array8)/sizeof(int);
    dysplayArray(array8, size);
    printTabela(check(array8, size));

    NUM_COMPS = 0;
    size = sizeof(array9)/sizeof(int);
    dysplayArray(array9, size);
    printTabela(check(array9, size));

    return 0;


}