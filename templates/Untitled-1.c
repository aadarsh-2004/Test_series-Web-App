#include <stdio.h>

void mergeSortedArrays(int A[], int m, int B[], int n, int merged[]) {
    int i = 0, j = 0, k = 0; 

    while (i < m && j < n) {
        if (A[i] < B[j]) {
            merged[k] = A[i];
            i++;
        } else {
            merged[k] = B[j];
            j++;
        }
        k++;
    }

    // Add remaining elements from A
    while (i < m) {
        merged[k] = A[i];
        i++;
        k++;
    }

    // Add remaining elements from B
    while (j < n) {
        merged[k] = B[j];
        j++;
        k++;
    }
}

int main() {
    int A[] = {10, 15, 20, 25};
    int m = sizeof(A) / sizeof(A[0]);

    int B[] = {2, 3, 5, 7};
    int n = sizeof(B) / sizeof(B[0]);

    int merged[m + n];

    mergeSortedArrays(A, m, B, n, merged);

    printf("Merged and sorted array: [");
    for (int i = 0; i < m + n; i++) {
        printf("%d", merged[i]);
        if (i < m + n - 1) {
            printf(", ");
        }
    }
    printf("]\n");

    return 0;
}
