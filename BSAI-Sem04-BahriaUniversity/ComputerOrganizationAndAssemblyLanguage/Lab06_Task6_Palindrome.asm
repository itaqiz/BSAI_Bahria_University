; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 6     : Write a procedure that checks whether a string is a
;              palindrome or not.
; ================================================================

INCLUDE Irvine32.inc

.data
msg1 BYTE 100 DUP(?)               ; Buffer for user input
msg2 BYTE " is a palindrome.", 0
msg3 BYTE " is not a palindrome.", 0

.code
main PROC
    ; Read user input
    mov edx, OFFSET msg1
    mov ecx, SIZEOF msg1
    call ReadString

    ; Calculate length of the input string
    mov ebx, OFFSET msg1
    mov ecx, 0
calculate_length:
    cmp byte ptr [ebx + ecx], 0
    je end_calculate_length
    inc ecx
    jmp calculate_length
end_calculate_length:

    mov esi, 0              ; start index
    mov edx, ecx
    dec edx                 ; last index

L1:
    cmp esi, edx
    jge yes
    mov al, [msg1 + esi]
    mov ah, [msg1 + edx]
    cmp al, ah
    jne notpalindrome
    inc esi
    dec edx
    jmp L1

notpalindrome:
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET msg3
    call WriteString
    jmp ExitProgram

yes:
    mov edx, OFFSET msg1
    call WriteString
    mov edx, OFFSET msg2
    call WriteString

ExitProgram:
    call Crlf
    call ExitProcess
main ENDP
END main
