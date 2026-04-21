; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    N dq 9 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE VALUE OF N!
           ; compute the sum of the first N fibonacci numbers
    sum_print_format db "Sum first %ld fibonacci numbers is %ld", 10, 0
    count dq 0;
section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    push rbx

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor rax, rax     ;store the sum in rax
    mov rbx, 0
    mov rcx, 1

    add rax, rbx
    add rax, rcx

    xor rdx, rdx
    loop:
        ; curr fib
        add rdx, rbx
        add rdx, rcx

        ; update sum & count
        add rax, rdx
        add qword [count], 1

        ; update fib(n-2), fib(n-1)
        mov rbx, rcx    
        mov rcx, rdx
        
        cmp 
        je loop

    ; Use the loop instruction

    mov rdi, sum_print_format
    mov rsi, [N]
    mov rdx, rax
    xor eax, eax     ; Required for variadic functions,
                     ; AL = number of XMM args (0 here)
    call printf

    pop rbx
    add rsp, 8
    xor rax, rax
    leave
    ret
