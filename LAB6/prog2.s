/*
Dicionario
Reg Var
ebx i
r12 p
ecx sum
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
# sum = 0
  movl  $0, %ecx      /* ecx = 0; */

# while(i != 4)
L1:
  cmpl  $4, %ebx      /* if (ebx == 4) ? */
  je    L2            /* goto L2 (sai do loop) */

# sum += *p;
  movl  (%r12), %eax  /* eax = *r12 (carrega o valor apontado por p) */
  addl  %eax, %ecx    /* ecx = ecx + eax (sum = sum + *p) */

# i++
  addl  $1, %ebx      /* ebx += 1; */
# p++
  addq  $4, %r12      /* r12 += 4; (avanca 4 bytes na memoria) */

# volta para L1
  jmp   L1            /* goto L1; */

L2: 
# printf("%d\n", sum);
/*************************************************************/
/* este trecho imprime o valor de sum                        */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro para string) */
  movl    %ecx, %esi   /* segundo parametro  (inteiro contido em sum) */
  call    printf       /* chama a funcao da biblioteca */
/*************************************************************/

# return 0; 
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/