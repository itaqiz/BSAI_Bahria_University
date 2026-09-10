; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : Implementing Flags
; Task 1a    : Write a program that uses addition and subtraction to
;              set Flags. Set and clear the CARRY FLAG.
; ================================================================

INCLUDE Irvine32.inc

.data
msg1 BYTE "Implementing Flags", 0

.code
main PROC
    mov edx, offset msg1
    call writestring
    call crlf

    mov eax, 0
    mov al, 255
    add al, 1              ; causes carry flag to be SET (255+1 overflows byte)
    call dumpregs
    call crlf

    sub al, 2              ; causes carry flag to be SET again (0-2 underflows)
    call dumpregs

    exit
main ENDP
END main
