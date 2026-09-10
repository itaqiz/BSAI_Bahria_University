; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 2     : Write a program that gets a string from the user and
;              stores it in a buffer. Then scan the string and
;              separate all small (lowercase) alphabets into another
;              buffer. Then print the buffer.
; ================================================================

INCLUDE Irvine32.inc

.data
arr1 BYTE 20 DUP(?)
inp  BYTE 20 DUP(?)

.code
main PROC
    mov esi, OFFSET inp
    mov ecx, LENGTHOF inp
inp1:
    call readChar
    call writeChar
    cmp al, 13              ; Check for Enter key
    JE En
    mov [esi], al           ; Store the character in the buffer
    inc esi
    loop inp1

En:
    ; Separate small alphabets into another buffer
    mov esi, OFFSET inp
    mov edi, OFFSET arr1

scanLoop:
    mov al, [esi]           ; Load a character from the input buffer
    cmp al, 'a'
    JB notLowercase
    cmp al, 'z'
    JA notLowercase
    mov [edi], al           ; If it's a small alphabet, store it
    inc edi
notLowercase:
    inc esi
    cmp al, 0               ; Check for the end of the string
    JE endScan
    jmp scanLoop

endScan:
    ; Print the result buffer
    mov edx, OFFSET arr1
    call writeString
    call crlf

    ret
main ENDP
end main
