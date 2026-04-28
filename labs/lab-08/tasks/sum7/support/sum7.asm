section .text

global sum7

sum7:
    push rbp
    mov rbp, rsp

    ; TODO: save the used registers and align the stack, if needed

    ; TODO: implement the sum7 function

    xor rax, rax

    mov rax, rdi
    add rax, rsi
    add rax, rdx
    add rax, rcx
    add rax, r8
    add rax, r9
    add rax, [rbp + 16]



    ; TODO: restore the used registers and the stack pointer, if altered

    leave
    ret
