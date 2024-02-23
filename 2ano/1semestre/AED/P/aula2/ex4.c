#include <stdio.h>
#include <stdlib.h>

void DisplayArray(double* a, size_t n){
    if (a == NULL || n == 0) {
        printf("Array is empty or NULL.\n");
        return;
    }

    printf("Array = [ ");
    for (size_t i = 0; i < n; i++) {
        printf("%.2f", a[i]);
        if (i < n - 1) {
            printf(", ");
        }
    }
    printf(" ]\n");
}

double* ReadArray(size_t* size_p) {
    if (size_p == NULL) {
        return NULL;
    }

    size_t n;
    printf("Enter the number of elements: ");
    scanf("%zu", &n);

    if (n == 0) {
        *size_p = 0;
        return NULL;
    }

    double* a = (double*) malloc(n * sizeof(double));
    if (a == NULL) {
        *size_p = 0;
        return NULL;
    }

    printf("Enter %zu elements:\n", n);
    for (size_t i = 0; i < n; i++) {
        scanf("%lf", &a[i]);
    }

    *size_p = n;
    return a;
}

double* Append(double* array_1, size_t size_1, double* array_2, size_t size_2) {
    if (array_1 == NULL || array_2 == NULL || size_1 == 0 || size_2 == 0) {
        return NULL;
    }

    double* a = (double*) malloc((size_1 + size_2) * sizeof(double));
    if (a == NULL) {
        return NULL;
    }

    for (size_t i = 0; i < size_1; i++) {
        a[i] = array_1[i];
    }

    for (size_t i = 0; i < size_2; i++) {
        a[size_1 + i] = array_2[i];
    }

    return a;
}

int main() {
    double a[] = { 1.0, 2.0, 3.0 };
    size_t n1 = sizeof(a) / sizeof(a[0]);
    double b[] = { 4.0, 5.0, 6.0, 7.0 };
    size_t n2 = sizeof(b) / sizeof(b[0]);

    double* c = Append(a, n1, b, n2);
    if (c == NULL) {
        printf("Failed to allocate memory for array.\n");
        return 1;
    }

    DisplayArray(a, n1);
    DisplayArray(b, n2);
    DisplayArray(c, n1 + n2);

    free(c);
    return 0;
}
