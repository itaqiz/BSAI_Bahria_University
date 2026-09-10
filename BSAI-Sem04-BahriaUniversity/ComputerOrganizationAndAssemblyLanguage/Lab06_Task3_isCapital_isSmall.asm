; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 3     : Write two procedures isCapital and isSmall which
;              return true/false by setting/clearing the carry flag.
;              Use these procedures to separate a mixed alphabetic
;              string into two strings: one with small letters and
;              one with capital letters. Display the result.
; ================================================================

INCLUDE Irvine32.inc

.data
inp     BYTE 20 DUP(?)
sa      BYTE 20 DUP(?)
ca      BYTE 20 DUP(?)
newline BYTE 10

.code
isSmall PROC
    ; Input:  AL - Character
    ; Output: Carry flag set if small letter, else cleared
    cmp al, 'a'
    jl notSmall
    cmp al, 'z'
    jg notSmall
    stc                     ; Set carry flag for small letter
    ret
notSmall:
    clc                     ; Clear carry flag for non-small letter
    ret
isSmall ENDP

isCapital PROC
    ; Input:  AL - Character
    ; Output: Carry flag set if capital letter, else cleared
    cmp al, 'A'
    jl notCapital
    cmp al, 'Z'
    jg notCapital
    stc                     ; Set carry flag for capital letter
    ret
notCapital:
    clc                     ; Clear carry flag for non-capital letter
    ret
isCapital ENDP

main PROC
    ; Get a string from the user and store it in the buffer
    mov esi, OFFSET inp
    mov ecx, lengthof inp
inputLoop:
    call readChar
    call writeChar
    cmp al, 13              ; Check for Enter key
    JE inputDone
    mov [esi], al
    inc esi
    loop inputLoop

inputDone:
    ; Separate small and capital alphabets into their respective buffers
    mov esi, OFFSET inp
    mov edi, OFFSET sa
    mov ebx, OFFSET ca

scanLoop:
    mov al, [esi]
    call isSmall
    JC isSmallLetter
    call isCapital
    JC isCapitalLetter
    jmp nextChar

isSmallLetter:
    mov [edi], al
    inc edi
    jmp nextChar

isCapitalLetter:
    mov [ebx], al
    inc ebx

nextChar:
    inc esi
    cmp al, 0               ; Check for the end of the string
    JE endScan
    jmp scanLoop

endScan:
    ; Print the small letters buffer
    mov edx, OFFSET sa
    call writeString
    mov edx, OFFSET newline
    call writeString

    ; Print the capital letters buffer
    mov edx, OFFSET ca
    call writeString

    call crlf
    ret
main ENDP
end main
