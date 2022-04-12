.data


A:
    .quad 0
B:
    .quad 0
C:
    .quad 0

m:
    .long 0
n:
    .long 0
l:
    .long 0


.text
    .globl MultiplMatrix
    .type MultiplMatrix, @function



MultiplMatrix:
    movq $A, %rax          
    movq %rdi, (%rax)
    movq $B, %rax
    movq %rsi, (%rax)
    movq $C, %rax
    movq %rdx, (%rax)

    movq $m, %rax           
    movl %ecx, (%rax)
    movq $n, %rax
    movl %r8d, (%rax)
    movq $l, %rax
    movl %r9d, (%rax)


    movq $m, %rax
    movl (%rax), %r9d       
    dec %r9d
i:

    movq $l, %rax
    movl (%rax), %r8d       
    dec %r8d
j:

    movq $n, %rax
    movl (%rax), %ecx       
    dec %ecx
k:

    movq $A, %rax           
    movq (%rax), %rsi
    movq %rcx, %rdx
    movq $n, %rax
    movl (%rax), %ebx
    movq %r9, %rax
    push %rcx
    call calc
    pop %rcx
    movq %rsi, %r13

    movq $B, %rax         
    movq (%rax), %rsi
    movq %r8, %rdx
    movq $l, %rax
    movl (%rax), %ebx
    movq %rcx, %rax
    push %rcx
    call calc
    pop %rcx
    movq %rsi, %r14

    movq $C, %rax           
    movq (%rax), %rsi
    movq %r8, %rdx
    movq $l, %rax
    movl (%rax), %ebx
    movq %r9, %rax
    push %rcx
    call calc
    pop %rcx
    movq %rsi, %r15

    movl (%r13), %eax       
    movl (%r14), %ebx       
    mull %ebx             
    movl (%r15), %edx       
    addl %edx, %eax        
    movl %eax, (%r15)       

    dec %ecx
    cmpl $-1, %ecx
    jne k

    dec %r8d
    cmpl $-1, %r8d
    jne j

    dec %r9d
    cmpl $-1, %r9d
    jne i

    ret
calc:
    push %rdx
    mull %ebx
    pop %rdx
    addl %edx, %eax
    movl $4, %ebx
    mull %ebx
    addq %rax, %rsi

    ret

