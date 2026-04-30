.text
  .globl boo
boo:
  pushq %rbp
  movq  %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  subq  $8, %rsp

  movq  %rdi, %r12
  movl  %esi, %r13d
  movl  %edx, %ebx

loop_start:
  movl  %r13d, %eax
  subl  $1, %r13d
  cmpl  $0, %eax
  je    loop_fim

  movl  (%r12), %edi
  movl  %ebx, %esi
  call  f

  movl  %eax, 4(%r12)
  addq  $8, %r12
  jmp   loop_start

loop_fim:
  addq  $8, %rsp
  popq  %r13
  popq  %r12
  popq  %rbx
  leave
  ret