; ============================================================
; CEL-324 Computer Organization and Assembly Language Lab
; Lab # 08: Base Index Addressing Mode to Handle 2D Array of Strings
; Name: Muhammad Taqui
; Enrollment-ID: 01-136221-021
; Class: BSAI(4A)
; ============================================================


; ------------------------------------------------------------
; Sample Program (from lab handout)
; ------------------------------------------------------------
.data
Array2D BYTE 1,2,3,4    ; ROWSIZE = 4
        BYTE 5,6,7,8    ; number of_COLUMNS = 4
        BYTE 9,10,11,12
        BYTE 13,14,15,16
.code
    mov ebx,OFFSET Array2D  ; LOAD FIRST ROW ADDRESS IN EBX
    mov ch, ROWSIZE
L2: mov cl, NO_of_COLUMNS
    mov esi,0               ; INITIALIZE INDEX REG TO 0
L1: mov al,[ebx+esi]        ; Access element at effective address [EBX+ESI]
    INC SI
    DEC CL
    JNZ L1
    ADD EBX, ROWSIZE
    DEC CH
    JNZ L2


; ------------------------------------------------------------
; Task 1: Given an array of 10 strings of equal size, print each
; string on a separate line.
; Hint: array byte "computer",0ah,0dh
;       mov ebx, offset array / mov ch, Rows
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
array byte "TAQUI",0ah,0dh
byte "MUHAMMAD",0ah,0dh
byte "TALHA",0ah,0dh
byte "BABER",0ah,0dh
byte "HASEEN",0ah,0dh
byte "HARIS",0ah,0dh
byte "HASSAN",0ah,0dh
byte "KALEEM",0ah,0dh
byte "TUFAIL",0ah,0dh
byte "COAL ",0ah,0dh
rows=10
coloumns=10
.code
main proc
    mov ebx,offset array
    mov ch,rows
l2:
    mov cl,coloumns
    mov esi,0
l1:
    mov al,[ebx+esi]
    call writechar
    inc esi
    dec cl
    jnz l1
    add ebx,coloumns
    dec ch
    jnz l2
    call crlf
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 2: Get 5 names from the user, store in an array of strings.
; Ask the user for a number and print the name stored at that
; position.
; Hint: mov [ebx+esi], al
; ------------------------------------------------------------
include Irvine32.inc
.data
namesArray BYTE 5, 20 DUP ('$')
inputPrompt BYTE "Enter name : ", 0
numberPrompt BYTE "Enter a number (1-5): ", 0
outputMsg BYTE "Name at position %d: %s", 0
errorMsg BYTE "Invalid number. Please enter a number between 1 and 5.", 0
.code
main PROC
    mov ecx, 5
    lea ebx, namesArray
    mov esi, 0
getNamesLoop:
    push ecx
    push esi
    mov edx, OFFSET inputPrompt
    mov eax, esi
    add eax, 1
    call WriteInt
    call WriteString
    mov edx, ebx
    mov ecx, 20
    call ReadString
    pop esi
    pop ecx
    inc esi
    loop getNamesLoop

    mov edx, OFFSET numberPrompt
    call WriteString
    call ReadInt
    mov esi, eax

    cmp esi, 1
    jl invalidNumber
    cmp esi, 5
    jg invalidNumber

    mov edx, OFFSET outputMsg
    mov eax, esi
    add eax, 1
    call WriteInt
    mov edx, ebx
    mov ecx, 20
    call WriteString
    jmp endProgram

invalidNumber:
    mov edx, OFFSET errorMsg
    call WriteString

endProgram:
    mov eax, 0
    call DumpRegs
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 3: Write a procedure that is passed the offset of an array
; of 10 strings of characters and prints all the strings.
; Hint: Print PROC / mov ch, rows / inc esi / dec cl / JNZ L1
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
array byte "TAQUI",0ah,0dh
byte "MUHAMMAD",0ah,0dh
byte "TALHA",0ah,0dh
byte "BABER",0ah,0dh
byte "HASEEN",0ah,0dh
byte "HARIS",0ah,0dh
byte "HASSAN",0ah,0dh
byte "KALEEM",0ah,0dh
byte "TUFAIL",0ah,0dh
byte "COAL ",0ah,0dh
rows = 10
columns = 10
.code
taqui PROC
    mov ebx, OFFSET array
    mov ecx, rows
l2:
    mov edx, columns
    mov esi, 0
l1:
    mov al, [ebx + esi]
    call writechar
    inc esi
    dec edx
    jnz l1
    add ebx, columns
    dec ecx
    jnz l2
    call crlf
    ret
taqui ENDP
main PROC
    call taqui
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 4: Modify Task 3 to make it a procedure that is passed the
; offset of a 10 x 10 array of DWORD integers, and prints the 2D
; array's sum of each row on a separate line.
; Hint: mov eax, columns / mov dl, 4 / mul dl
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
array2D DWORD 1,2,3,4,5,6,7,8,9,10
        DWORD 11,12,13,14,15,16,17,18,19,20
        DWORD 21,22,23,24,25,26,27,28,29,30
        DWORD 31,32,33,34,35,36,37,38,39,40
        DWORD 41,42,43,44,45,46,47,48,49,50
        DWORD 51,52,53,54,55,56,57,58,59,60
        DWORD 61,62,63,64,65,66,67,68,69,70
        DWORD 71,72,73,74,75,76,77,78,79,80
        DWORD 81,82,83,84,85,86,87,88,89,90
        DWORD 91,92,93,94,95,96,97,98,99,100
rowsize DWORD 10
columsize DWORD 10
.code
SUM PROC
    mov ecx, 10
    call crlf
l1:
    mov esi, 0
    mov eax, 0
    mov edx, ecx
    mov ecx, 10
l2:
    add eax, [ebx+esi]
    add esi, 4
    loop l2
    call writeDec
    call crlf
    mov eax, 20
    add ebx, eax
    mov ecx, edx
    loop l1
    ret
SUM ENDP
main PROC
    mov ebx, OFFSET array2D
    call SUM
    exit
main ENDP
end main
