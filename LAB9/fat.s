.text
  .globl fat
  fat:

    pushq %rbp
    movq  %rsp, %rbp
    
    
    pushq %rbx
    subq  $8, %rsp      

    /* if (n == 0) */
    cmpl  $0, %edi
    jne   caso_recursivo

  /* caso base: return 1 */
    movl  $1, %eax
    jmp   fim_fat

  caso_recursivo:
    movl  %edi, %ebx    
    
    /* prepara chamada fat(n-1) */
    subl  $1, %edi     
    call  fat          
    
  
    imull %ebx, %eax    /* %eax = %eax * %ebx */

  fim_fat:

    addq  $8, %rsp      
    popq  %rbx          
    leave
    ret