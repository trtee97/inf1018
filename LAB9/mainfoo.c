#include <stdio.h>

void foo(int a[], int n);

int main(void) {
    int a[] = {1, 2, 0, 4, 0, 6};
    int n = 6;
    
    printf("Array original: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
    foo(a, n);
    printf("Array apos foo: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");

    return 0;
}