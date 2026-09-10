; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 01   : Basic Assembly Language Concepts
; Task 3     : Write a program to get a number from the user and
;              print the register values.
; ================================================================

INCLUDE Irvine32.inc

.data
a DWORD ?

.code
Main PROC
    mov eax, a
    call readInt
    call writeInt
    call dumpRegs
    call waitMsg

    Exit
main ENDP
End main
