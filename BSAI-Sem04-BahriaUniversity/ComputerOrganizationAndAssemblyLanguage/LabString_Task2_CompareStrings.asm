; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : String Operations
; Task 2     : Write a program to compare the contents of 2 strings
;              using compare operations.
; ================================================================

INCLUDE Irvine32.inc

.data
string1     BYTE "Assembly!", 0
string2     BYTE "Assembly!", 0
equalMsg    BYTE "Strings are equal.", 0
notEqualMsg BYTE "Strings are not equal.", 0

.code
main PROC
    mov esi, OFFSET string1
    mov edi, OFFSET string2
    call CompareStrings
    cmp eax, 0
    je equalStrings
    mov edx, OFFSET notEqualMsg
    jmp displayResult

equalStrings:
    mov edx, OFFSET equalMsg

displayResult:
    call WriteString
    call crlf
    exit
main ENDP

CompareStrings PROC
repeatCompare:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne stringsNotEqual
    cmp al, 0
    je stringsEqual
    inc esi
    inc edi
    jmp repeatCompare

stringsEqual:
    mov eax, 0
    ret

stringsNotEqual:
    mov eax, 1
    ret
CompareStrings ENDP

END main
