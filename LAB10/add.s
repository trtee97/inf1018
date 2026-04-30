.text
  .globl add
add:
  pushq %rbp
  movq  %rsp, %rbp
  movl  $0, %eax

loop_inicio:
  cmpq  $0, %rdi
  je    loop_fim
  addl  (%rdi), %eax
  movq  8(%rdi), %rdi
  jmp   loop_inicio

loop_fim:
  leave
  ret