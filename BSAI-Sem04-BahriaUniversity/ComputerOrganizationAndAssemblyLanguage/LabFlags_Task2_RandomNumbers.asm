; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : Implementing Flags / Random Numbers
; Task 2     : Generate 10 random numbers between 0 and 20.
;              (move upper limit in eax register).
; ================================================================

INCLUDE Irvine32.inc

.data
msg1 BYTE "Generating Random Numbers", 0

.code
main PROC
    mov edx, offset msg1
    call writestring
    call crlf

    mov ecx, 10             ; generate 10 numbers
input:
    mov eax, 21             ; upper limit (0 to 20 inclusive)
    call randomrange
    call writeint
    call crlf
    loop input

    exit
main ENDP
END main
