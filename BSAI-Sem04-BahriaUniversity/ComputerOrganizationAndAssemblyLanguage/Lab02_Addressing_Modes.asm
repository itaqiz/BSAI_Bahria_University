; ============================================================
; CEL-324 Computer Organization and Assembly Language Lab
; Lab # 02: Addressing Modes in Assembly Language
; Name: Muhammad Taqui
; Enrollment-ID: 01-136221-021
; Class: BS-AI(4A)
; ============================================================


; ------------------------------------------------------------
; Task 1: Display an unsigned integer in binary, decimal, and
; hexadecimal, each on a separate line. Use Val = 20 for test.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
a DWORD 20
.code
Main PROC
    mov eax , a
    call writebin
    call crlf
    call writedec
    call crlf
    call writehex
    call crlf
    call writeint
    call dumpregs
    call waitmsg
    exit
main endp
end main


; ------------------------------------------------------------
; Task 2: Write a program that subtracts 2 numbers and prints
; the result.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
A DWORD 25
B DWORD 12
.code
Main PROC
    mov eax,A
    mov ebx,B
    SUB eax,ebx
    call writeInt
    call dumpRegs
    call waitMsg
    Exit
main ENDP
End main


; ------------------------------------------------------------
; Task 3: Write a program to add two numbers and print the result.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
A DWORD 25
B DWORD 12
.code
Main PROC
    mov eax,A
    mov ebx,B
    ADD eax,ebx
    call writeInt
    call dumpRegs
    call waitMsg
    Exit
main ENDP
End main


; ------------------------------------------------------------
; Task 4: Write a program that will prompt the user to enter a
; number n and then display "I like assembly language" n times.
; Hint: msg byte "I like assembly language",0
;       call writestring
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
msg BYTE "I like assembly language",0
promptMsg BYTE "Enter a number: ",0
n DWORD ?
.code
Main PROC
    mov edx, offset promptMsg
    call writestring
    call readint
    mov n, eax
    mov ecx, n
L1:
    mov edx, offset msg
    call writestring
    call crlf
    loop L1
    exit
main ENDP
End main


; ------------------------------------------------------------
; Task 5: Write a program to solve the expression a+b-(b-a)+a
; and print the result.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
a DWORD 5
b DWORD 2
.code
Main PROC
    mov eax,a
    mov ebx,b
    SUB ebx,eax
    mov ecx,ebx
    ADD eax,b
    SUB eax,ecx
    ADD eax,a
    call WriteInt
    call DumpRegs
    Exit
main ENDP
End main
