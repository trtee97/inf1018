#include <stdio.h>
#include <ctype.h> 
/*
Quando o código encontra uma letra como 'a', a operação tolower(*s) - 'a' + 10 resulta em 0. 
Pois o valor de ASCII de 'a' menos 'a' é zero. Ao somarmos 10, garantimos que ele seja tratado matemáticamente como valor 10.
*/
int string2num(char *s, int base) {
    int a = 0;
    for (; *s; s++) {
        int digito;
        
        if (isdigit(*s)) {
            digito = *s - '0';
        } else {
            digito = tolower(*s) - 'a' + 10;
        }
        
        a = a * base + digito;
    }
    return a;
}

int main(void) {
    
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("z09b", 36));

    return 0;
}