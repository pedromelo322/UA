#include <stdio.h>
#include <math.h>

int factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n-1);
    }
}

int isFactorion(int n, int* factorials) {
    int sum = 0;
    int digit;
    while (n > 0) {
        digit = n % 10;
        sum += factorials[digit];
        n /= 10;
    }
    return sum == n;
}

int main() {
    int factorials[10];
    for (int i = 0; i < 10; i++) {
        factorials[i] = factorial(i);
    }

    int n_max = pow(10, 6);
    for (int i = 1; i < n_max; i++) {
        if (isFactorion(i, factorials)) {
            printf("%d\n", i);
        }
    }

    return 0;
}