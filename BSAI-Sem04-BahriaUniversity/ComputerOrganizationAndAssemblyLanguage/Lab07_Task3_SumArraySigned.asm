; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 07   : Stack frames, parameters and local variables
; Task 3     : Write a program to find the sum of an array of
;              signed DWORD numbers using a SUM procedure.
; ================================================================

INCLUDE Irvine32.inc

.data
myarray SDWORD 2, 3, 5, 6

.code
main PROC
    MOV EBX, offset myarray
    mov ecx, lengthof myarray
    push ebx
    push ecx
    call sum
    call crlf

    mov eax, ebx
    call writeint

    add esp, 8
    exit
main ENDP

sum PROC
    mov esi, [esp + 8]
    mov ecx, [esp + 4]
    mov ebx, 0

l1:
    mov eax, [esi]
    call writeint
    add ebx, eax
    add esi, 4
    loop l1

    ret
sum ENDP

end main
