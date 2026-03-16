#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n) {

    return (unsigned char)((x << n) | (x >> (8 - n)));
}

int main(void) {
    unsigned char val = 0x61; 

    printf("Valor original: 0x%02X\n", val);
    printf("--------------------------\n");   
    printf("Rotate left de 1 bit : 0x%02X \n", rotate_left(val, 1));
    printf("Rotate left de 2 bits: 0x%02X \n", rotate_left(val, 2));
    printf("Rotate left de 7 bits: 0x%02X \n", rotate_left(val, 7));

    return 0;
}