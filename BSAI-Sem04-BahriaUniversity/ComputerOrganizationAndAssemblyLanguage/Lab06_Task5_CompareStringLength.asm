; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 5     : Write a procedure that is passed two strings and
;              compares them to check if they are of the same
;              length or not.
; ================================================================

INCLUDE Irvine32.inc

.data
str1    BYTE 20 DUP(?)
str2    BYTE 20 DUP(?)
msgYes  BYTE "The strings have the same length.", 0
msgNo   BYTE "The strings have different lengths.", 0
prompt1 BYTE "Enter the first string: ", 0
prompt2 BYTE "Enter the second string: ", 0

.code
CompareStringLength PROC
    ; Input:
    ;   edi: Pointer to the first string
    ;   esi: Pointer to the second string
    ; Output:
    ;   Z flag set if strings have the same length, cleared otherwise

    xor eax, eax             ; Counter for the first string
    xor ebx, ebx             ; Counter for the second string

findLength1:
    cmp byte ptr [edi], 0    ; Check if end of string is reached
    je endFindLength1
    inc edi
    inc eax
    jmp findLength1
endFindLength1:

    xor ecx, ecx             ; Counter for the second string
findLength2:
    cmp byte ptr [esi], 0
    je endFindLength2
    inc esi
    inc ecx
    jmp findLength2
endFindLength2:

    cmp eax, ecx              ; Compare the lengths -> sets Z flag
    ret
CompareStringLength ENDP

main PROC
    ; Get the first string from the user
    mov edx, OFFSET prompt1
    call writeString
    mov edx, OFFSET str1
    mov ecx, LENGTHOF str1
    call readString

    ; Get the second string from the user
    mov edx, OFFSET prompt2
    call writeString
    mov edx, OFFSET str2
    mov ecx, LENGTHOF str2
    call readString

    ; Compare the lengths of the strings
    lea edi, [str1]
    lea esi, [str2]
    call CompareStringLength

    jz stringsSameLength
    jmp stringsDifferentLength

stringsSameLength:
    mov edx, OFFSET msgYes
    call writeString
    jmp endProgram

stringsDifferentLength:
    mov edx, OFFSET msgNo
    call writeString
    jmp endProgram

endProgram:
    call crlf
    ret
main ENDP
end main
