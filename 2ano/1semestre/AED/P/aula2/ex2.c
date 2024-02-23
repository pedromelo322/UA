#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char str1[100], str2[100];

    // Read two strings
    printf("Enter the first string: ");
    scanf("%s", &str1);
    printf("Enter the second string: ");
    scanf("%s", &str2);



    for(int i = 0; str1[i] != '\0'; i++) {
        if(isalpha(str1[i])) {
            printf("%c é uma letra do alfabeto.\n", str1[i]);
        } else {
            printf("%c não é uma letra do alfabeto.\n", str1[i]);
        }
    }

    for(int i = 0; str2[i] != '\0'; i++) {
        if(isalpha(str2[i])) {
            if(isupper(str2[i])) {
                printf("%c é uma letra maiúscula.\n", str2[i]);
            } else {
                printf("%c é uma letra minúscula.\n", str2[i]);
            }
        } else {
                printf("%c não é uma letra.\n", str2[i]);
        }
        
    }

    for(int i = 0; str1[i] != '\0'; i++) {
        str1[i] = tolower(str1[i]);
    }
    for(int i = 0; str2[i] != '\0'; i++) {
        str2[i] = tolower(str2[i]);
    }

    printf("Str1 min : %s\n", str1);
    printf("Str2 min : %s\n", str2);

    int cmp = strcmp(str1, str2);
    if(cmp == 0) {
        printf("As strings são iguais.\n");
    } else {
        printf("As strings em ordem lexicográfica são:\n");
        if(cmp < 0) {
            printf("%s; %s\n", str1, str2);
        } else {
            printf("%s; %s\n", str2, str1);
        }
    }

    char str2_copia[100];

    strcpy(str2_copia,str2);

    printf("Str2 copia : %s\n", str2_copia);
    printf("Str2 original : %s\n", str2);


    printf("concatenação : %s\n", strcat(str2_copia, str2));


    return 0;
}