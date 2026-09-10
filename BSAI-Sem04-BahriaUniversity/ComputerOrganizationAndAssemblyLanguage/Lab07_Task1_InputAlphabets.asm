; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 07   : Stack frames, parameters and local variables
; Task 1     : Write a procedure that inputs a string of alphabets
;              into a buffer. The caller passes the offset address
;              of a storage area and the maximum length of string.
;              When called it displays "Please Enter a string of
;              Alphabets". If the user presses Enter, it returns to
;              the caller. If a non-alphabet/non-Enter key is
;              pressed, that key is rejected and the message is
;              printed again. Uses Irvine's ReadChar.
; ================================================================

INCLUDE Irvine32.inc

.data
promptMsg BYTE "Please Enter a string of Alphabets: ", 0
errorMsg  BYTE "Invalid input. Please enter only Alphabets.", 0
buffer    BYTE 10 DUP(?)

.code
InputAlphabets PROC
    push ebp
    mov ebp, esp

    mov edx, OFFSET promptMsg
    call WriteString
    call crlf

    mov ecx, [ebp + 8]        ; max length
    mov edi, [ebp + 12]       ; offset of storage area

inputLoop:
    call ReadChar
    cmp al, 13                ; Enter key
    je inputDone

    cmp al, 'A'
    jl inputError
    cmp al, 'Z'
    jbe validInput

    cmp al, 'a'
    jl inputError
    cmp al, 'z'
    ja inputError

validInput:
    mov [edi], al
    inc edi
    loop inputLoop
    jmp inputDone

inputError:
    mov edx, OFFSET errorMsg
    call WriteString
    call crlf
    jmp inputLoop

inputDone:
    pop ebp
    ret 8
InputAlphabets ENDP

main PROC
    mov edx, OFFSET buffer
    push edx                  ; offset (2nd param)
    push 10                   ; max length (1st param)
    call InputAlphabets

    exit
main ENDP
END main
