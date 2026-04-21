%include "printf64.asm"

%define NUM 5

section .text

extern printf
global main
main:
    mov rbp, rsp

    ; TODO 1: replace every "push" instruction by an equivalent sequence of commands (use direct addressing of memory. Hint: rsp)
    mov rcx, NUM
push_nums:
    push rcx
    loop push_nums

    sub rsp, 8
    mov qword [rsp], 0

    mov rax, "handsome"
    sub rsp, 8
    mov [rsp], rax

    mov rax, "is very "
    sub rsp, 8
    mov [rsp], rax

    mov rax, "Anthony "
    sub rsp, 8
    mov [rsp], rax

    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi

    ; TODO 2: print the stack in "address: value" format in the range of [RSP:RBP]
    ; use PRINTF64 macro - see format above

print_addy:
    PRINTF64 `%p: 0x%x \n\x0`, rsp, qword [rsp]
    add rsp, 8
    cmp rsp, rbp
    jl print_addy

    ; TODO 3: print the string
    PRINTF64 `%s\n\x0`, rsi
    ; TODO 4: print the array on the stack, element by element.

    ; restore the previous value of the rbp (Base Pointer)
    mov rsp, rbp

    ; exit without errors
    xor rax, rax
    ret
