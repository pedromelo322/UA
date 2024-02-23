#include <stdio.h>

void print_sizeof(char* type_name, size_t size) {
    printf("sizeof(%s)............%zu\n", type_name, size);
}

int main(int argc, char const *argv[]) {
    print_sizeof("void *", sizeof(void *));
    print_sizeof("void", sizeof(void));
    print_sizeof("char", sizeof(char));
    print_sizeof("short", sizeof(short));
    print_sizeof("int", sizeof(int));
    print_sizeof("long", sizeof(long));
    print_sizeof("long long", sizeof(long long));
    print_sizeof("float", sizeof(float));
    print_sizeof("double", sizeof(double));

    return 0;
}