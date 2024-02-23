#include <stdio.h>
#include <math.h>


// The coefficients of a degree n polynomial
// are stored in an array p of size (n + 1)
// p[0] is the coefficient of the largest degree term
// p[n] is the coefficient of the zero-degree term
// Display a polynomial
// Pre-Conditions: coef != NULL and degree >= 0
// Example of produced output:
// Pol(x) = 1.000000 * x^2 + 4.000000 * x^1 + 1.000000

void DisplayPol(double* coef, size_t degree) {

    if (coef != NULL & degree >= 0){


        printf("Pol(x) =");


        for (size_t i = 0; i <= degree; i++)
        {

            if (i == degree){
                printf(" %lf\n", *(coef + i));
            }else{
            printf(" %lf * x^%d +", *(coef + i), (degree-i));
            }
        }
        

    }

}


double elevate(double num, size_t exp){

    double v = 1;

    for (size_t i = 0; i < exp; i++)
    {
        v *= num;
    }

    

    return v;
    

}


// Compute the value of a polynomial using Horner’s method:
// Pre-Conditions: coef != NULL and degree >= 0

double ComputePol(double* coef, size_t degree, double x) {

    if (coef != NULL & degree >= 0){

        double valor = 0;

        for (size_t i = 0; i <= degree; (i++, coef++)){

            valor += ((*coef)*(elevate(x,(degree-i))));
        }

        return valor;

    }

    return 0;

}

// Test example:
// Pol(x) = 1.000000 * x^2 + 4.000000 * x^1 + 1.000000
// Pol(2.000000) = 13.000000
// Compute the real roots, if any, of a second-degree polynomial
// Pre-Conditions: coef != NULL and degree == 2 and coef[0] != 0
// Pre-Conditions: root_1 != NULL and root_2 != NULL
// Return values: 0 -> no real roots
// 1 -> 1 real root with multiplicity 2
// 2 -> 2 distinct real roots
// The computed root values are returned via the root_1 and root_2
// pointer arguments
// Assign 0.0 to the *root_1 and *root_2 if there are no real roots

unsigned int GetRealRoots(double* coef, size_t degree, double* root_1, double* root_2)
{


    if (coef != NULL & degree == 2 & coef[0] != 0){
        if (root_1 != NULL & root_2 != NULL){


            int valor;
            double a,b,c;


            switch (degree)
            {
            case 1:
                
                *root_1 = (double) (coef[1])/(coef[0]);
                *root_2 = 0;

                break;
            

            case 2:

                a = coef[2];
                b = coef[1];
                c = coef[0];

                *root_1 = (double) ((-b) + sqrt(elevate(b, 2) - 4*a*c))/(2 * a);

                *root_2 = (double) ((-b) - sqrt(elevate(b, 2) - 4*a*c))/(2 * a);
                break;
            
            default:

                *root_1 = 0;

                *root_2 = 0;

                break;
            }


        }
    }

    return 0;

}

int main(int argc, char const *argv[])
{

    double coefeciente[3] = {1,4,1};
    size_t degree = 2;
    double x = 2;
    double root_1, root_2;

    
    DisplayPol(coefeciente, degree);
    printf("Pol(%lf) = %lf\n",x,ComputePol(coefeciente, degree, 2));
    GetRealRoots(coefeciente,degree,&root_1, &root_2);
    printf("Raizes reais: %lf e %lf", root_1, root_2);

    return 0;
}
