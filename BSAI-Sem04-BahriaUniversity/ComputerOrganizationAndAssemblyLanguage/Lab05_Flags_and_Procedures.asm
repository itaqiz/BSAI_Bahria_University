; ============================================================
; CEL-324 Computer Organization and Assembly Language Lab
; Lab # 05: Flags and Procedures
; Name: Muhammad Taqui
; Enrollment-ID: 01-136221-021
; ============================================================


; ------------------------------------------------------------
; Task 1: Display "Please enter your name:" using WriteString,
; read the name into a buffer using ReadString, then display
; "Welcome to assembly lab:" followed by the entered name.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
promptMessage BYTE "Please enter your name:", 0
greeting BYTE "Welcome to assembly lab:",0
buffer BYTE 100 DUP(0)
newline BYTE 0
.code
Main PROC
    mov edx,offset promptMessage
    call writestring
    mov edx,offset buffer
    mov ecx,100
    call readstring
    mov edx,offset greeting
    call writestring
    mov edx,offset buffer
    call writestring
    mov edx,offset newline
    call writestring
    exit
main ENDP
End main


; ------------------------------------------------------------
; Task 2: Write a procedure that reverses the given string and
; stores the result in another buffer area.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
msg1 byte " Bahria University ",0
msg2 byte 80 dup(0)
.code
main PROC
    mov edx,0
    mov ebx,offset msg1
    mov edi, offset msg2
    mov esi,lengthof msg1
    mov ecx,lengthof msg2
    dec esi
T1:
    mov al,[ebx+esi]
    mov [edi],al
    inc edi
    dec esi
    Loop T1
    mov edi,offset msg2
    mov ecx,lengthof msg2
T2:
    mov al,[edi]
    call writechar
    inc edi
    Loop T2
    call crlf
    exit
main ENDP
end main


; ------------------------------------------------------------
; Task 3: Write a program to access and print an array of 16-bit
; integers using base index mode, also print the sum of the array.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
msg BYTE "Total sum:"
myArray BYTE 5, 10, 15, 20, 25
.code
main PROC
    mov eax, 0
    mov ebx, offset myArray
    mov ecx, lengthof myArray
    mov esi, 0
T1:
    add al, [ebx + esi]
    inc esi
    dec ecx
    jnz T1
    call writeDec
    call crlf
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 4: Write a program to access and print the string array
; using base index mode.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
msg1 BYTE "Muhammad Taqui", 0
.code
main PROC
    mov ebx, offset msg1
    mov ecx, lengthof msg1
    mov esi, 0
T1:
    mov al, [ebx + esi]
    inc esi
    dec ecx
    call writechar
    jnz T1
    call crlf
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 5: Write a program to reverse an array using base index mode.
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
array DWORD 7,17,27,37,47
.code
main PROC
    mov ESI, OFFSET array
    mov EDI, OFFSET array + (LENGTHOF array - 1) * 4
    mov ECX, LENGTHOF array / 2
T1:
    mov EAX, [ESI]
    mov EBX, [EDI]
    mov [EDI], EAX
    mov [ESI], EBX
    add ESI, 4
    sub EDI, 4
    loop T1
    mov ESI, OFFSET array
    mov ECX, LENGTHOF array
T2:
    MOV EAX, [ESI]
    call WriteDec
    call Crlf
    add ESI, 4
    loop T2
    exit
main ENDP
END main
