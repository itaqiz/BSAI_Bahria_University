; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : Implementing Flags
; Task 4     : Write a program that copies unsigned numbers from one
;              array to another but it copies only the numbers that
;              are Greater than a number entered by the user.
; ================================================================

INCLUDE irvine32.inc
INCLUDELIB irvine32.lib

.data
array1 DWORD 51, 61, 17, 18, 9, 10
array2 DWORD 6 DUP(0)
msg1   BYTE "Enter num: ", 0
msg2   BYTE "Copied Numbers Greater Than Entered Value:", 0

.code
main PROC
    mov edx, offset msg1
    call writestring
    call readint             ; eax = user number (threshold)
    call crlf

    mov esi, offset array1   ; esi -> array1
    mov edi, offset array2   ; edi -> array2
    mov ecx, 6                ; loop counter

talha1:
    mov ebx, [esi]
    cmp ebx, eax
    JA copy                   ; if array1 element > user number, copy it
    jmp noCopy

copy:
    mov [edi], ebx
    add edi, TYPE array2

noCopy:
    add esi, TYPE array1
    LOOP talha1

    mov esi, offset array2
    mov edx, offset msg2
    call writestring
    call crlf

    mov ecx, 6
talha2:
    mov eax, [esi]
    call Writeint
    add esi, TYPE array2
    call Crlf
    loop talha2

    exit
main ENDP
end main
