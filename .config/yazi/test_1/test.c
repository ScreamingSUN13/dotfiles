/* Test script for syntax highlighting */
#include <stdio.h>

typedef struct {
    int x;
    int y;
} Point;

int add(int a, int b) {
    return a + b;
}

int main(void) {
    Point p = {1, 2};
    printf("Sum: %d\n", add(p.x, p.y));
    return 0;
}
