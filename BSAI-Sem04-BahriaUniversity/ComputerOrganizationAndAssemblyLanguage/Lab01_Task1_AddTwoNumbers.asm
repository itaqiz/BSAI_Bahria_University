; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 01   : Basic Assembly Language Concepts
; Task 1     : Write a program to add two numbers and print the
;              result.
; ================================================================

INCLUDE Irvine32.inc

.data
a DWORD 5
b DWORD 7

.code
Main PROC
    mov eax, a
    ADD eax, b
    call writeInt
    call dumpRegs
    call waitMsg

    Exit
main ENDP
End main
