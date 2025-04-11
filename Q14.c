#include<stdio.h>

int square(int n) {
    return n * n;
}

int main() {
    int i;
    for(i = 0; i < 10; i++){
        printf("%d\n", square(i));
    }
    return 0;
}