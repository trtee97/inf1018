.text
  .globl foo
  foo:

    pushq %rbp
    movq  %rsp, %rbp

    movl  $0, %ecx      
    movl  $0, %r8d     

  loop_foo:
    /* if (i >= n) sai do loop */
    cmpl  %esi, %ecx    /* compara n (%esi) com i (%ecx) */
    jge   fim_foo

    movslq %ecx, %rcx

    movl  (%rdi, %rcx, 4), %eax 

    addl  %eax, %r8d

    /* if (a[i] == 0) */
    cmpl  $0, %eax
    jne   proxima_iteracao
    /* a[i] = s; s = 0; */
    movl  %r8d, (%rdi, %rcx, 4) 
    movl  $0, %r8d      

  proxima_iteracao:
    incl  %ecx          
    jmp   loop_foo

  fim_foo:
    leave
    ret