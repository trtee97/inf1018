.data
S2:  .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:  .string "%c"
Sf2: .string "\n"

.text
.globl  main
main:

/********************************************************/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  
  movq    %r12, -16(%rbp) 
/********************************************************/

  movq  $S2, %r12         /* r12 = &S2 */

L1:
  cmpb  $0, (%r12)        /* if (*pc == 0) ? */
  je  L2                  /* goto L2 (fim da string) */

  movsbl  (%r12), %eax    /* eax = *r12 */


  cmpl  $123, %eax        /* compara o caractere com '{' (123) */
  je    L_INC             /* se for igual, pula o printf e vai para o incremento */
  
  cmpl  $125, %eax        /* Compara o caractere com '}' (125) */
  je    L_INC             /* se for igual, pula o printf e vai para o incremento */

/*************************************************************/
/* este trecho imprime o valor de %eax (só executa se não pulou) */
  movq    $Sf, %rdi    
  movl    %eax, %esi   
  movl    $0, %eax
  call    printf       
/*************************************************************/

L_INC:                    /* label de incremento para onde os pulos convergem */
  addq  $1, %r12          /* r12 += 1; (pc++) */
  jmp  L1                 /* goto L1; */

L2:  
/*************************************************************/
/* este trecho imprime o \n */
  movq  $Sf2, %rdi    
  movl  $0, %eax
  call  printf       
/*************************************************************/

/***************************************************************/
  movq  $0, %rax  
  movq  -16(%rbp), %r12 
  movq  -8(%rbp), %rbx  
  leave
  ret      
/***************************************************************/