section .data
    print_format db "String length is %d", 10, 0

section .text

extern printf
global print_string_length

print_string_length:
    push rbp
    mov rbp, rsp

    ; TODO: save the used registers and align the stack, if needed
    sub rsp, 8
    push rcx
    mov rcx, rdi

    ; TODO: print the string length
    mov rdi, print_format
    mov rsi, rcx
    call printf

    pop rcx
    add rsp, 8


    ; TODO: restore the used registers and the stack pointer, if altered

    leave
    ret
