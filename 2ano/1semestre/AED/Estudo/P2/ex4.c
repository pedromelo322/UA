#include <stdio.h>
#include <stdlib.h>

// Display the contents of array a with n elements
// Pre-Conditions: a != NULL and n > 0
// Example of produced output: Array = [ 1.00, 2.00, 3.00 ]


void DisplayArray(double* a, size_t n) {

    printf("Array = [");


    for (double *i = a; i < a + n; i++)
    {
        if (i != a){
            printf(",");
        }
        printf(" %.2f", *i);
    }
    

    printf("]\n");



}


// Read the number of elements, allocate the array and read its elements
// Condition: number of elements > 0
// Pre-Condition: size_p != NULL
// Return NULL if memory allocation fails
// Set *size_p to ZERO if memory allocation fails


double* ReadArray(size_t* size_p) { 


    if (size_p != NULL){
        if (size_p > 0){
            double *ptr = (double *) malloc(10*sizeof(double));
            if (ptr == NULL){
                *size_p = 0;
            }
            else{
                return ptr;
            }
        }
    }

    return NULL;





}


// Allocate and return a new array with (size_1 + size_2) elements
// which stores the elements of array_1 followed by the elements of array_2
// Pre-Conditions: array_1 != NULL and array_2 != NULL
// Pre-Conditions: size_1 > 0 and size_2 > 0
// Return NULL if memory allocation fails


void joinArray(double * ptr, double * array, size_t size){


    for (double *i = array; i < array + size; (i++, ptr++))
    {
        *ptr = *i;
    }


}



double* Append(double* array_1, size_t size_1, double* array_2, size_t size_2) {

    if (array_1 != NULL & array_2 != NULL & size_1  > 0 & size_2 > 0){

        double *ptr = (double *) malloc((size_1 + size_2)*sizeof(double));

        if (ptr != NULL){


                joinArray(ptr, array_1, size_1);
                joinArray(ptr+size_1, array_2, size_2);

            return ptr;

        }

    }

    return NULL;

}


void atribuir(double *a, size_t t){


    for (double *i = a; i < a + t; i++)
    {
        printf("Insira um número: ");
        scanf("%lf", i);
    }


}


// Test example: Array = [ 1.00, 2.00, 3.00 ]
// Array = [ 4.00, 5.00, 6.00, 7.00 ]
// Array = [ 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00 ]

int main(int argc, char const *argv[])
{

    

    size_t size1 = 3;
    size_t size2 = 4;
    size_t sizejunta = size1 + size2;

    double *array1 = ReadArray(&size1);
    double *array2 = ReadArray(&size2);


    printf("Arra1:\n");
    atribuir(array1, size1);
    printf("Arra2:\n");
    atribuir(array2, size2);

    double * arrayjunta = Append(array1, size1, array2, size2);

    DisplayArray(array1,size1);
    DisplayArray(array2,size2);
    DisplayArray(arrayjunta,sizejunta);


    free(array1);
    free(array2);
    free(arrayjunta);

    printf("Clean");


    return 0;
}
