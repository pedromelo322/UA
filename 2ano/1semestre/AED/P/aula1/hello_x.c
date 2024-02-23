#include <stdio.h>
#include <string.h>


int main()
{
    char first_name[20], last_name[20];
    printf("Qual é o teu nome oh morcão: ");
    scanf("%s %s", first_name, last_name);
    printf("Hello %s %s", first_name, last_name);

    return 0;
}

