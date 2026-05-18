.section .rodata
.LC0:	.string "numero: "
.LC1:	.string "%d"

.text
.globl novonum
novonum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq $.LC0, %rdi
	movl $0, %eax
	call printf

	movq $.LC1, %rdi
	leaq -4(%rbp), %rsi
	movl $0, %eax
	call scanf

	movl -4(%rbp), %eax

	leave 
	ret
