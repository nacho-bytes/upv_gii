#include <stdio.h>

int x=2;

void m() {
    x = 4;
}

void main() {
    int x = 3;
    m();
    printf("%d", x);
}
