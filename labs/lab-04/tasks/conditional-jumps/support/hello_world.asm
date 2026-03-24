; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    myString: db "Hello, World!", 0
    N: dq 6                         ; N = 6
    myOtherString: db "Goodbye, World!", 0
    
section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]              ; rcx will store the value of N
    PRINTF64 `%d\n\x0`, rcx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov rax, 2
    mov r8, 1
    cmp rax, r8
    jg print                        ; TODO1: rax > r8?
    xor rax, rax

    leave
    ret

print:
    PRINTF64 `%s\n\x0`, myString
    sub dword [N], 1                                 ; TODO2.2: print "Hello, World!" N times
    jnz print
    PRINTF64 `%s\n\x0`, myOtherString
   xor rax, rax

    leave
    ret
