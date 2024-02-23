#include<stdio.h>
#include <math.h>


typedef struct {
    int (*function)(int*);
    char* nome;

} FuncaoNome;




int square(int *a){
    return (*a)*(*a);
}

int root(int *a){
    return sqrt(*a);

}



int func(FuncaoNome *fn, int *a){

    printf("O valor d%s de %d é %d\n", fn->nome, *a,fn->function(a));

    return 0;
}



int main(int argc, char const *argv[])
{


    FuncaoNome fn1;
    FuncaoNome fn2;

    fn1.function = square;
    fn1.nome = "o quadrado";

    fn2.function = root;
    fn2.nome = "a raiz quadrada";


    int num;

    printf("Insira um número: ");
    scanf("%d", &num);


    func(&fn1, &num);
    func(&fn2, &num);


    
    return 0;
}