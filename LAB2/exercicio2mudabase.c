#include <stdio.h>
//na modificação, foi dada uma multiplicação de 'a' por um enésimo número, fazendo com que seja possível alterar a base do número desejado.
int string2num(char *s, int base) {
  int a = 0;
  for (; *s; s++) {
    int digito = *s - '0'; 
    a = a * base + digito;
  }
  return a;
}

int main(void) {
  
  printf("Base 8:  %d\n", string2num("777", 8));
  printf("Base 10: %d\n", string2num("777", 10));

  return 0;
}