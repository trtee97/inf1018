#include <stdio.h>

unsigned char switch_byte(unsigned char x) {

    return (unsigned char)(((x & 0x0F) << 4) | ((x & 0xF0) >> 4));
}

int main(void) {
    unsigned char valor1 = 0xAB;
    unsigned char valor2 = 0x1F;
    unsigned char valor3 = 0x40;
    unsigned char valor4 = 0xCC; // teste com metades iguais

    printf("Trocando as metades do byte:\n");
    printf("Original: %02X -> Trocado: %02X\n", valor1, switch_byte(valor1));
    printf("Original: %02X -> Trocado: %02X\n", valor2, switch_byte(valor2));
    printf("Original: %02X -> Trocado: %02X\n", valor3, switch_byte(valor3));
    printf("Original: %02X -> Trocado: %02X\n", valor4, switch_byte(valor4));

    return 0;
}