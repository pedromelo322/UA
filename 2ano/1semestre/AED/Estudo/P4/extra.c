#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

size_t NUM_COMPS;

void dysplayArray(int * array, int size){

    

    for (int i = 0; i < size; i++)
    {
        printf("[");
        printf("%3d", array[i]);
        printf("]");
    }

}

void printComparacoes(){


    printf("    [Nº de Comparações][%d]\n",NUM_COMPS);


}

void printCopias(int v){


    printf("    [Nº de Cópias][%d]\n",v,NUM_COMPS);


}

void copy(int* array, int size, int * array_final){

    int size_final = 0;
    for (int i = 0; i < size; i++)
    {
        if (array[i] != -1){

            array_final[size_final] = array[i];
            size_final ++;
        }
        
    }

    dysplayArray(array_final, size_final);
    printCopias(size_final);

}





void check(int* array, int *size_usado, int *size){

    assert(*size_usado > 1);

    *size = *size_usado;

    for (int i = 0; i < *size_usado-1; i++)
    {

        if (array[i] != -1){

            //printf("\ni: %d\n", array[i]);

            for (int k = (i+1); k < *size_usado; k++)
            {

                NUM_COMPS ++;

                if (array[k] != -1){


                    

                    //printf("\nk: %d\n",array[k]);

                    
                    //printf("\nArray:  ");
                    //dysplayArray(array, *size_usado);

                    if (array[i] != array[k] && array[i] % array[k] != 0 && array[k] % array[i] != 0){
                        continue;
                    }else{

                        array[k] = -1;
                        (*size) --;
                    }

                    //dysplayArray(array, *size_usado);

                    
                }

                
            }
        }
        

        
    }


}


int main(int argc, char const *argv[])
{

    int size;
    int size_final;
    int *array_final;


    int array1[10] = {2,2,2,3,3,4,5,8,8,9};
    int array2[10] = {7,8,2,2,3,3,3,8,8,9}; 
    int array3[20] = {1,2,4,8,5,6,7,8,9,10,1,2,4,8,16,6,7,8,9,10}; 
    int array6[5]  = {1,2,2,4,3}; 
    int array7[15] = {1,2,1,3,2,6,7,8,9,10,3,2,4,4,1}; 
    int array8[10] = {1,2,1,4,5,6,7,8,9,10}; 
    int array9[10] = {1,2,3,4,5,6,7,8,9,10};
    

    NUM_COMPS = 0;
    size = sizeof(array1)/sizeof(int);
    size_final = 0;
    dysplayArray(array1, size);
    check(array1, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size_final*sizeof(int));
    copy(array1,size ,array_final);


    NUM_COMPS = 0;
    size = sizeof(array2)/sizeof(int);
    size_final = 0;
    dysplayArray(array2, size);
    check(array2, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size_final*sizeof(int));
    copy(array2,size,array_final);
    


    NUM_COMPS = 0;
    size = sizeof(array3)/sizeof(int);
    size_final = 0;
    dysplayArray(array3, size);
    check(array3, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size*sizeof(int));
    copy(array3,size ,array_final);
        



        


    NUM_COMPS = 0;
    size = sizeof(array6)/sizeof(int);
    size_final = 0;
    dysplayArray(array6, size);
    check(array6, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size*sizeof(int));
    copy(array6,size ,array_final);
        


    NUM_COMPS = 0;
    size = sizeof(array7)/sizeof(int);
    size_final = 0;
    dysplayArray(array7, size);
    check(array7, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size*sizeof(int));
    copy(array7,size ,array_final);
        

    NUM_COMPS = 0;
    size = sizeof(array8)/sizeof(int);
    size_final = 0;
    dysplayArray(array8, size);
    check(array8, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size*sizeof(int));
    copy(array8,size ,array_final);
        

    NUM_COMPS = 0;
    size = sizeof(array9)/sizeof(int);
    size_final = 0;
    dysplayArray(array9, size);
    check(array9, &size, &size_final);
    printComparacoes();
    array_final = (int *) malloc(size*sizeof(int));
    copy(array9,size ,array_final);
        


    free(array_final);



    return 0;

    


}
