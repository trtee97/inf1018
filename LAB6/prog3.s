/*
Dicionario
Reg Var
ebx i
r12 p
*/

.data
# int nums[] = {10, -21, -30, 45};
nums:  .int  10, -21, -30, 45
Sf:    .string "%d\n"    # string de formato para printf

.text
.globl  main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)
/********************************************************/

# i = 0
  movl  $0, %ebx      /* ebx = 0; */
# p = nums
  movq  $nums, %r12   /* r12 = &nums; */

# while(i != 4)
L1:
  cmpl  $4, %ebx      /* if (ebx == 4) ? */
  je    L2            /* goto L2 (sai do loop) */

# Lógica do if ((*p % 2) == 0)
  movl  (%r12), %eax  /* eax = *r12 (carrega o valor para ser impresso) */
  
  movl  %eax, %ecx    /* ecx = eax  (salva o valor em ecx para testar) */
  andl  $1, %ecx      /* ecx = ecx & 1 (testa o bit menos significativo) */
  
  cmpl  $0, %ecx      /* compara o resultado do AND com 0 */
  jne   PULA_PRINT    /* jump se nao for igual (se nao for igual a 0, é impar, então pula o printf) */

# printf("%d\n", *p);
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)        */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call    printf       /* chama a funcao da biblioteca */
/*************************************************************/

PULA_PRINT:
# i++
  addl  $1, %ebx      /* ebx += 1; */
# p++
  addq  $4, %r12      /* r12 += 4; (avança para o proximo int) */

# volta para L1
  jmp   L1            /* goto L1; */

L2: 
# return 0; 
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/