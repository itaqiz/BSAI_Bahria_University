; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 06   : Conditional Jumps and Menu driven Procedures
; Task 1     : Write a program that asks the user to enter a number
;              between 0 and 100. Program should display the
;              appropriate grade using CMP and JMP.
;              90-100 = A, 80-89 = B, 70-79 = C, 60-69 = D, 0-59 = F
; ================================================================

INCLUDE Irvine32.inc

.data
msg0 BYTE "Please enter your marks: ", 0
msg1 BYTE "Your grade is A", 0
msg2 BYTE "Your grade is B", 0
msg3 BYTE "Your grade is C", 0
msg4 BYTE "Your grade is D", 0
msg5 BYTE "Sorry you failed", 0
msg6 BYTE "Invalid enter", 0

.code
main PROC
    mov edx, offset msg0
    call writeString
    call crlf
    call readInt
    call grade
    exit
main ENDP

grade PROC
    cmp eax, 100
    JA gEr
    cmp eax, 90
    JAE gA
    cmp eax, 80
    JAE gB
    cmp eax, 70
    JAE gC
    cmp eax, 60
    JAE gD
    cmp eax, 0
    JAE gF
    JB gEr

gEr:
    mov edx, offset msg6
    call writeString
    jmp gZ
gA:
    mov edx, offset msg1
    call writeString
    jmp gZ
gB:
    mov edx, offset msg2
    call writeString
    jmp gZ
gC:
    mov edx, offset msg3
    call writeString
    jmp gZ
gD:
    mov edx, offset msg4
    call writeString
    jmp gZ
gF:
    mov edx, offset msg5
    call writeString
gZ:
    call crlf
    ret
grade ENDP
end main
