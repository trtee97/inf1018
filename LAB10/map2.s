.text
  .globl map2
map2:
  pushq %rbp
  movq  %rsp, %rbp
  pushq %rbx
  pushq %r12
  pushq %r13
  pushq %r14

  movq  %rdi, %r12
  movq  %rsi, %r13
  movl  %edx, %r14d
  movl  $0, %ebx

loop_start:
  cmpl  %r14d, %ebx
  jge   loop_end

  movslq %ebx, %rax
  movl  (%r12, %rax, 4), %edi
  call  f

  movslq %ebx, %rcx
  movl  %eax, (%r13, %rcx, 4)

  addl  $1, %ebx
  jmp   loop_start

loop_end:
  popq  %r14
  popq  %r13
  popq  %r12
  popq  %rbx
  leave
  ret