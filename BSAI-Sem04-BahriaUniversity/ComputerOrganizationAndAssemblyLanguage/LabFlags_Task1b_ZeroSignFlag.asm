; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : Implementing Flags
; Task 1b    : Write a program that uses addition and subtraction to
;              set Flags. Set and clear the ZERO FLAG and SIGN FLAG.
; ================================================================

INCLUDE Irvine32.inc

.data
a DWORD 1

.code
main PROC
    mov eax, a
    sub eax, 2             ; 1 - 2 = -1 -> sets SIGN flag
    call dumpregs
    call crlf

    mov eax, a
    sub eax, 1             ; 1 - 1 = 0 -> sets ZERO flag
    call dumpregs

    exit
main ENDP
END main
