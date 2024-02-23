#include <stdio.h>
#include <string.h>
#include <ctype.h>


int conct(char str[], char str_copia[]){

    int count = 0;


    char str_conc[20];

    for (int i = 0; str[i] != '\0'; (i++, count++))
    {
        
        str_conc[count] = str[i];
    }

    for (int i = 0; str_copia[i] != '\0'; (i++, count++))
    {
        
        str_conc[count] = str[i];
    }

    printf("String concatnada com cópia: %s", str_conc);
    


}


int copia(char *str, char *str_copia){

    for (char *i = str; *i != '\0' ; i++)
    {
        *str_copia = *i;
        str_copia ++;
    }
    

}

int comp(char str1[], char str2[]){

    int cmp = strcmp(str1, str2);

    if (cmp == 0){

        printf("As string são iguais\n");

    }else if(cmp < 0){

        printf("Ordem lexicogográfica: %s, %s\n", str1, str2);

    }else{

        printf("Ordem lexicogográfica: %s, %s\n", str2, str1);

    }


}



int opStr1(char *str1){

    int count = 0;

    

    for (char *i = str1; *i != '\0'; i++)
    {

        if (isalpha(*i)){
            count ++;
            if (isupper(*i)){
                *i = tolower(*i);
            }
        }
    }

    printf("caracteres da primeira string são: %d\n", count);
    

    return 0;

}

int opStr2(char *str2){

    int count = 0;

    for (char *i = str2; *i != '\0'; i++)
    {

        if (isalpha(*i)){
            if (isupper(*i)){
                count ++;
                *i = tolower(*i);
            }
        }
    }

    printf("caracteres maiusculos da segunda string são: %d\n", count);
}




int main(int argc, char const *argv[])
{


    char str1[10], str2[10], str_copia[10];

    


    printf("Primeira str: ");
    scanf("%s", &str1);
    



    printf("Segunda str: ");
    scanf("%s", &str2);


    opStr1(str1);
    opStr2(str2);

    printf("String com todas as letras minúsculas: %s\n",str1);
    printf("String com todas as letras minúsculas: %s\n",str2);

    comp(str1,str2);

    copia(str2, str_copia);

    printf("String cópia: %s\n", str_copia);

    conct(str2, str_copia);
    

    return 0;
}
