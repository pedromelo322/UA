#include <stdio.h>
#include <math.h>
#include <stdlib.h>

void Display(double* Array, size_t n){

    if (n >= 0){
        printf("Pol(x) = ");
        for (size_t i = 0; i <= n; i++)
        {   
            if (n-i == 0){
                printf("%.6lf ", Array[i]);
            }else{
                printf("%.6lfx^%zu + ", Array[i], n-i);  
            }
                  
        }
        printf("\n");
    }

    
}

double ComputePol(double* Array, size_t n, double* x){
    printf("Valor de x : ");
    scanf("%lf", x);

    double resultado = 0;

    for (size_t i = 0; i <= n; i++)
    {
        int expoente = pow(*x, (int)(n-i));
        resultado += Array[i] * expoente;
    }
    
    return resultado;
}


double* ReadPol(size_t* deggre){

    printf("Grau do polinómio: ");
    scanf("%zu",deggre); 


    if (*deggre < 1){

        return NULL;

    }else{

        double* coeficientes = malloc((*deggre + 1) * sizeof(double));
        for (size_t i = 0; i <= *deggre; i++)
        {
            printf("Polinómio de grau %d: ", *deggre-i);
            scanf("%lf", &coeficientes[i]);
        }

        return coeficientes;
        
    }
}


int main(int argc, char const *argv[])
{
    size_t deggre = 0;
    double x = 0;

    double* array = ReadPol(&deggre);

    Display(array, deggre);
    double res = ComputePol(array, deggre, &x);

    printf("Pol(%lf) = %lf",x,res);

    free(array);
    return 0;
}
