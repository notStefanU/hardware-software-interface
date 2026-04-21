; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0

section .text
extern printf
global main

main:
    push rbp
    mov rbp, rsp

    ; Print all three values (int_x, char_y, string_s) from sample_obj.
    ; Hint: use "lea reg, [base + offset]" to save the result of
    ; "base + offset" into register "reg"
    
    PRINTF64 `int_x: %d\n\0`, qword [sample_obj + int_x]
    PRINTF64 `char_y: %c\n\0`, qword [sample_obj + char_y]
    lea rdx, [sample_obj + string_s]
    PRINTF64 `string_s: %s\n\0`, rdx

    ; TODO: write the equivalent of "sample_obj->int_x = new_int".
    lea rdx, [sample_obj + int_x]
    mov dword [rdx], new_int
    ; TODO: write the equivalent of "sample_obj->char_y = new_char".
    lea rdx, [sample_obj + char_y]
    mov byte [rdx], new_char
    ; TODO: write the equivalent of "strcpy(sample_obj->string_s, new_string)".
    mov rcx, 0
    loop:
        lea rdx, [sample_obj + string_s + rcx]
        lea rax, [new_string + rcx]
        mov byte [rdx], 

        cmp rcx, 14
        je bye
        add rcx, 1

    ; TODO: print all three values again to validate the results of the
    ; three set operations above.

bye:
    xor rax, rax
    leave
    ret
