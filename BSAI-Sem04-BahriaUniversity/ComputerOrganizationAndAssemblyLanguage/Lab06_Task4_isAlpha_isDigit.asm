; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 4     : Write procedures IsAlpha and IsDigit. Get a character
;              from the user and check whether that character is
;              alphabet or digit. Use carry flag to return true or
;              false value. Print the appropriate message.
; ================================================================

INCLUDE Irvine32.inc

.data
msg3 BYTE "Enter Any Character (alphabet/Digit)", 0
msg  BYTE "Its an alphabet", 0
msg2 BYTE "Its a Digit", 0

.code
isalpha PROC                ; isalpha proc
    cmp al, 'A'
    JB NEqual
    cmp al, 'Z'
    JG NEqual
    mov edx, offset msg
    call writestring
    JMP DONE
NEqual:
    cmp al, 'a'
    JB Skip
    cmp al, 'z'
    JA Skip
    mov edx, offset msg
    call writestring
    Jmp Done
Skip:
Done:
    ret
isalpha ENDP

isdigitt PROC                ; isdigit proc
    cmp al, '0'
    JAE Equal
    cmp al, '9'
    JBE Equal
    JMP next
Equal:
    mov edx, offset msg2
    call writestring
next:
    ret
isdigitt ENDP

main PROC                    ; main proc
    mov edx, offset msg3
    call writestring
    call crlf
    call readchar
    call writechar
    call crlf
    cmp al, '9'
    JA alpha
    call isdigitt
    JMP DONE
alpha:
    call isalpha
DONE:
    call crlf
    exit
main ENDP
end main
