/*
Dicionario
Reg Var
ebx i
r12 p
*/

.data
# char nums[] = {10, -21, -30, 45};
nums:  .byte  10, -21, -30, 45
Sf:    .string "%d\n"    # string de formato para printf

.text
#int main()
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
#i = 0
  movl  $0, %ebx     /* ebx = 0; */
#p = nums
  movq  $nums, %r12  /* r12 = &nums */

#while(i!=4)
L1:
  cmpl  $4, %ebx     /* if (ebx == 4) ? */
  je  L2             /* goto L2 */

#printf("%d\n", *p);
  
  # MUDANÇA 1: leitura com extensão de sinal
  movsbl  (%r12), %eax  /* eax = (int)(*r12). lê 1 byte e estende para 32 bits */

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf         /* chama a funcao da biblioteca */
/*************************************************************/

#i++
  addl  $1, %ebx     /* ebx += 1; */

#p++
  # MUDANÇA 2: aritmética de ponteiro para char
  addq  $1, %r12     /* r12 += 1;  */

# volta para L1
  jmp  L1            /* goto L1; */

L2: 
#return 0; 
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/