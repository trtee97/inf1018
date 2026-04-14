.data
nums: .long 65, -105, 111, 34
Sf:   .string "soma = %d\n"

.text
.globl main
main:
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl    $0, %r12d
  movl    $0, %ebx

L1:
  cmpl    $4, %ebx
  jge     L2

  movslq  %ebx, %rcx
  imulq   $4, %rcx
  addq    $nums, %rcx

  movl    (%rcx), %eax
  addl    %eax, %r12d

  addl    $1, %ebx
  jmp     L1

L2:
  movq    $Sf, %rdi
  movl    %r12d, %esi
  movl    $0, %eax
  call    printf

  movl    $0, %eax
  movq    -16(%rbp), %r12
  movq    -8(%rbp), %rbx
  leave
  ret