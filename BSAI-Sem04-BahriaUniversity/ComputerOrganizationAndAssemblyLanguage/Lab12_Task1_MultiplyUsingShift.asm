; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 12   : Shift Instructions
; Task 1     : Write a program that multiplies two numbers using
;              shift instructions.
;              (n1 * n2, where n2 is decomposed into powers of two)
; ================================================================

INCLUDE Irvine32.inc

.data
n1 DWORD 6
n2 DWORD 2
r  DWORD ?

.code
main PROC
    mov eax, n1
    mov ecx, n2
    mov ebx, 0

    ; n1 * 2  (shift left by 1)
    shl eax, 1
    add ebx, eax

    ; n1 * 4  (shift left by 2)
    mov eax, n1
    shl eax, 2
    add ebx, eax

    ; n1 * 8  (shift left by 3)
    mov eax, n1
    shl eax, 3
    add ebx, eax

    mov r, ebx
    mov eax, r
    call WriteInt
    call Crlf

    exit
main ENDP
END main
