; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 01   : Basic Assembly Language Concepts
; Task 2     : Write a program that copies integers with the help
;              of the mov instruction from var1 to var2.
; ================================================================

INCLUDE Irvine32.inc

.data
a DWORD 7
b DWORD 5

.code
Main PROC
    mov eax, a
    mov b, eax

    call writeInt
    call dumpRegs
    call waitMsg

    Exit
main ENDP
End main
