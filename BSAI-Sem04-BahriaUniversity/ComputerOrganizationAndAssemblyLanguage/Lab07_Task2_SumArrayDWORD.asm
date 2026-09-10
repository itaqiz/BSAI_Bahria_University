; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 07   : Stack frames, parameters and local variables
; Task 2     : Write a program to find the sum of an array of
;              unsigned DWORD numbers using a SUM procedure, passing
;              the array address and size via the stack.
; ================================================================

INCLUDE Irvine32.inc

.data
myarray DWORD 2, 3, 4, 5

.code
main PROC
    MOV EBX, OFFSET myarray
    mov ecx, LENGTHOF myarray
    push ebx
    push ecx
    call sum
    call Crlf

    mov eax, ebx
    call WriteInt

    add esp, 8
    call WaitMsg
    exit
main ENDP

sum PROC
    mov esi, [esp + 8]        ; address of the array
    mov ecx, [esp + 4]        ; size of the array
    xor ebx, ebx               ; initialize sum to 0

l1:
    mov eax, [esi]
    call WriteInt              ; display current element
    add ebx, eax                ; add to sum
    add esi, 4
    loop l1

    ret
sum ENDP

END main
