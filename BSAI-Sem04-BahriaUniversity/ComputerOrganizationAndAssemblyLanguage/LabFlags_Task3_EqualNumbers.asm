; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : Implementing Flags
; Task 3     : Write a program that takes two numbers from the user
;              and decides whether those numbers are equal or not.
; ================================================================

INCLUDE Irvine32.inc

.data
msg1 BYTE "Numbers are equal", 0
msg2 BYTE "Numbers are not equal", 0
a    DWORD ?
b    DWORD ?

.code
main PROC
    call readint
    call writeint
    call crlf
    mov ebx, eax

    call readint
    call writeint
    call crlf

    cmp eax, ebx
    JE yes

    mov edx, offset msg2
    call writestring
    call crlf
    jmp R1

yes:
    mov edx, offset msg1
    call writestring
    call crlf

R1:
    exit
main ENDP
END main
