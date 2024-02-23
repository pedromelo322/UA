#include<stdio.h>


int NUM_REC;


int f1(int n){


    if (n == 1){
        return 1;
    }else{
        NUM_REC ++;
        return f1(n/2) + n;
    }

    return 0;


}

int f2(int n){

    if (n == 1){
        return 1;
    }else if(n>1){
        NUM_REC ++;
        return f2(n/2) + f2(n/2) + n;
    }

    return 0;

    
}

int f3(int n){

    if (n == 1){
        return 1;
    }else if(n % 2 != 0){
        NUM_REC ++;
        return f3(n/2) + f3(n/2) + n;
    }else{
        NUM_REC ++;
        return 2 * f3(n/2) + n;
    }

    return 0;
    
}

void num(int n){

    printf("[%2d]", n);

}

void linha(int n){
    printf("[%12d][%14d]", n, NUM_REC);
}


int main(int argc, char const *argv[])
{

    


    printf("[%2s][%14s][%15s][%14s][%15s][%14s][%15s]\n","N","1ª Função(N)","Nº de Chamadas","2ª Função(N)","Nº de Chamadas","3ª Função(N)","Nº de Chamadas");

    for (int i = 1; i < 16; i++)
    {
        num(i);
        NUM_REC = 0;
        linha(f1(i));
        NUM_REC = 0;
        linha(f2(i));
        NUM_REC = 0;
        linha(f3(i));
        puts("");
    }
    
    return 0;
}


