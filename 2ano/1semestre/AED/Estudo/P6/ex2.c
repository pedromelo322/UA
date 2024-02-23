#include <stdio.h>
#include <assert.h>

#define N 8

int arrayValores[N+1] = {0,5,1,2,10,6,2,5,9};
int arrayGlobal[N+1] = {0};
int arrayEscolhido[N+1] = {0};

int F1(int i){
    assert(i>=0);

    int valor;

    if (arrayGlobal[i] != 0){
        valor = arrayGlobal[i];
    }else{
    
        if (i == 0){
            valor  = 0;
        }else if(i == 1){
            valor = arrayValores[1];
        }else{
            if (arrayValores[i] + F1(i - 2) > F1(i-1)){
                valor = arrayValores[i] + F1(i - 2);
            }else{
                valor = F1(i-1);
            }

            

        }

        arrayGlobal[i] = valor;

    }

    return valor;
}

void printArray(int *array){

    for (int i = 0; i < N+1; i++)
    {
        printf("\n%d",array[i]);
    }
    printf("\n----------------");
    


}

void printArrayEscolhido() {
    int i = N;
    printf("Elementos escolhidos: ");
    while (i > 0) {
        printf("%d ", i);
        i = arrayEscolhido[i];
    }
    printf("\n");

    i = N;
    printf("Moedas escolhidas são: ");
    while (i > 0) {
        printf("%d ", arrayValores[i]);
        i = arrayEscolhido[i];
    }
    printf("\n");


}








int F2(){

    int array[N+1] = {0};



    array[0] = 0;

    array[1] = arrayValores[1];

    for (int i = 2; i < N+1; i++)
    {

        
        if (arrayValores[i] + array[i - 2] > array[i-1]){
                array[i] = arrayValores[i] + array[i - 2];
                arrayEscolhido[i] = i-2;

            }else{
                array[i] = array[i-1];
                arrayEscolhido[i] = i-1;

            }
    }


    printArray(array);
    return array[N];
}




int main(int argc, char const *argv[]){



    int valor = F1(N);

    printArray(arrayGlobal);

    printf("\nResultado ig: %d", valor);

    printf("\n----------------");


    printf("\nResultado ig: %d",F2());

    printf("\n----------------\n");


    printArrayEscolhido(N);


    

    return 0;
}
