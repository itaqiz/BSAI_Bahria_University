; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : String Operations
; Task 1     : Write a program to move data from one string to
;              another using string operations (rep movsb).
; ================================================================

INCLUDE Irvine32.inc

.DATA
sourceString      BYTE "Assembly Language!", 0
destinationString BYTE 20 DUP(?)

.CODE
main PROC
    mov esi, OFFSET sourceString
    mov edi, OFFSET destinationString
    mov ecx, LENGTHOF sourceString
    cld
    rep movsb

    mov edx, OFFSET destinationString
    call WriteString
    call Crlf

    exit
main ENDP
END main
