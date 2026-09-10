; ============================================================
; CEL-324 Computer Organization and Assembly Language Lab
; Lab # 03: Data Related Operators and Directives in Assembly Language
; Name: Muhammad Taqui
; Enrollment-ID: 01-136221-021
; ============================================================


; ------------------------------------------------------------
; Sample Program (from lab handout)
; ------------------------------------------------------------
.data
array word 100h,200h,300h,400h
.code
mov edi, offset array
mov ecx, LENGTHOF array
mov ax,0
L1:
Add ax, [edi]
Add edi,TYPE array
Loop L1
Exit
Main ENDP
END main


; ------------------------------------------------------------
; Task 1: Write a program that uses a loop to input six signed
; 32-bit integers from the user, stores the integers in an array,
; and redisplays the integers.
; Hint: myarray SDword 6 dup(?)
;       call readint / mov [esi], eax / add esi,TYPE myarray
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
myarray SDword 6 dup(?)
.code
Main PROC
    mov ecx,6
    mov eax,0
    mov esi,offset myarray
input:
    call readint
    mov [esi],eax
    add esi,TYPE myarray
    loop input
    mov ecx,6
    mov eax,0
    mov esi,offset myarray
    call crlf
output:
    mov eax,[esi]
    add esi,type myarray
    call WriteDec
    call crlf
    loop output
    call writeint
    call dumpregs
    call waitmsg
main ENDP
End main


; ------------------------------------------------------------
; Task 2: Write a program that uses a loop to input five integers
; from the user, stores the integers in an array, and redisplays
; the integers and sum of the array.
; Hint: myarray SDword 5 dup(?), s sdword 0
;       call readint / mov [esi], eax / add s,eax
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
myarray SDword 5 dup(?)
s SDWORD 0
.code
Main PROC
    mov ecx,5
    mov eax,0
    mov esi,offset myarray
input:
    call readint
    mov [esi],eax
    add s,eax
    add esi,TYPE myarray
    loop input
    mov ecx,5
    mov eax,0
    mov esi,offset myarray
    call crlf
output:
    mov eax,[esi]
    add esi,type myarray
    call WriteDec
    call crlf
    loop output
    mov eax,s
    call writeint
    call dumpregs
    call waitmsg
main ENDP
End main


; ------------------------------------------------------------
; Task 3: Write a program to move a signed number from a smaller
; register to a bigger register.
; Hint: movzx ax, bl
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
x SBYTE 1000111b
.code
Main PROC
    mov eax,0
    movzx eax,x
    call writeint
    call dumpregs
    call waitmsg
main ENDP
End main


; ------------------------------------------------------------
; Task 4: Write a program to move an unsigned number from a
; smaller register to a bigger register.
; Hint: movsx ax, bl
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
x SBYTE 1000111b
.code
Main PROC
    mov eax,0
    mov bl,x
    mov ax,0
    movsx ax,bl
    call writeint
    call dumpregs
    call waitmsg
main ENDP
End main


; ------------------------------------------------------------
; Task 5: Write a program to exchange two numbers entered by
; the user.
; Hint: xchg eax, ebx
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
msg1 BYTE "Enter first number:",0
msg2 BYTE "Enter second number :",0
x DWORD 0
y DWORD 0
.code
Main PROC
    mov eax,0
    mov edx,offset msg1
    call writestring
    call crlf
    call readint
    mov x,eax
    mov edx,offset msg2
    call writestring
    call crlf
    call readint
    mov y,eax
    mov eax,0
    mov ebx,0
    mov eax,x
    mov ebx,y
    xchg eax,ebx
    call writeint
    call crlf
    call writeint
    call dumpregs
    call waitmsg
main ENDP
End main
