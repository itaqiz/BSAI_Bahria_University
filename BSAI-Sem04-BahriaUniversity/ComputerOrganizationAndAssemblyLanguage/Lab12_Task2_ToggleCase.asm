; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 12   : Shift Instructions
; Task 2     : Write a program that takes a string from the user
;              and converts it to capital letters if the string is
;              in small letters (and vice versa). Use AND, OR
;              instructions.
; ================================================================

INCLUDE Irvine32.inc

.data
inp    BYTE 100 DUP(?)
prompt BYTE "Enter any string: ", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET inp
    mov ecx, sizeof inp
    call ReadString

    mov esi, 0
Convert_loop:
    mov al, [edx + esi]
    cmp al, 0
    je done

    cmp al, 'a'
    jl checkUpper
    cmp al, 'z'
    jg checkUpper
    and al, 11011111b        ; lowercase -> uppercase
    jmp nextChar

checkUpper:
    cmp al, 'A'
    jl notLetter
    cmp al, 'Z'
    jg notLetter
    or al, 00100000b          ; uppercase -> lowercase
    jmp nextChar

notLetter:
    jmp nextChar

nextChar:
    mov [edx + esi], al
    inc esi
    jmp Convert_loop

done:
    mov edx, OFFSET inp
    call WriteString
    call crlf

    exit
main ENDP
END main
