; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 11   : String Procedures - INVOKE and ADDR
; Task 1     : Write a program that inputs multiple integers from
;              the user, stores them in an array, calculates the
;              sum of the array and displays the sum using procedures.
; ================================================================

INCLUDE Irvine32.inc

.data
array DWORD 5 DUP(?)

.code
SumArray PROC
    mov esi, offset array
    mov ecx, lengthof array
L2:
    add eax, [esi]
    add esi, type array
    Loop L2
    call writeint
    ret
SumArray ENDP

main PROC
    mov esi, offset array
    mov ecx, lengthof array
L1:
    call readint
    mov [esi], eax
    add esi, type array
    Loop L1

    mov eax, 0
    call SumArray

    exit
main ENDP
END main
