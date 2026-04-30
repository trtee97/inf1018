.text
  .globl add2
add2:
  pushq %rbp
  movq  %rsp, %rbp
  pushq %rbx
  subq  $8, %rsp

  cmpq  $0, %rdi
  je    base_case

  movl  (%rdi), %ebx
  movq  8(%rdi), %rdi
  call  add2
  addl  %ebx, %eax
  jmp   fim_add2

base_case:
  movl  $0, %eax

fim_add2:
  addq  $8, %rsp
  popq  %rbx
  leave
  ret