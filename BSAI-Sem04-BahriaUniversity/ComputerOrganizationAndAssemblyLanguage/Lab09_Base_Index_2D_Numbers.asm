; ============================================================
; CEL-324 Computer Organization and Assembly Language Lab
; Lab # 09: Base Index Addressing Mode to Handle 2D Array of Numbers
; Name: Muhammad Taqui
; Enrollment-ID: 01-136221-021
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
; Task 1: Get integers from the user and store them in an array,
; then get an index from the user and print the number stored at
; that position.
; Hint: call readchar / call writechar
;       mov [ebx],al / add ebx,type arr
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
arr DWORD 10 DUP(?)
index DWORD ?
message BYTE "Enter an integer: ", 0
indexMessage BYTE "Enter an index (0-9): ", 0
errMsg BYTE "Invalid index. Please enter an index between 0 and 9.", 0
.code
main PROC
    mov ebx, OFFSET arr
    mov ecx, 10
inputTaqui:
    mov edx, OFFSET message
    call WriteString
    call ReadInt
    mov [ebx], eax
    add ebx, TYPE arr
    loop inputTaqui

    mov edx, OFFSET indexMessage
    call WriteString
    call ReadInt

    cmp eax, 0
    jl printError
    cmp eax, 10
    jge printError

    mov ecx, eax
    mov ebx, OFFSET arr
    imul ecx, TYPE arr
    add ebx, ecx

    mov eax, [ebx]
    call WriteInt
    jmp endProgram

printError:
    mov edx, OFFSET errMsg
    call WriteString
    jmp endProgram

endProgram:
    call Crlf
    exit
main ENDP
END main


; ------------------------------------------------------------
; Task 2: Get a number from the user then compare the number with
; each element of a 2D array. If the number is found then print
; the row index and column index of the number.
; Hint: L1: mov cl,1
;       L2: mov eax,0 / cmp ebx,[esi]
; ------------------------------------------------------------
INCLUDE Irvine32.inc
.data
arr dword 10,9,8
    dword 7,6,5
    dword 4,3,2
msg1 BYTE "row: ",0
msg2 BYTE "col: ",0
row = 4
col = 4
.code
main PROC
    mov eax,0
    mov ch,1
    call readint
    mov ebx,eax
    mov esi,offset arr
L1:
    mov cl,1
L2:
    mov eax,0
    cmp ebx,[esi]
    jne nope
    mov al,ch
    mov edx,offset msg1
    call writestring
    call writedec
    call crlf
    mov al,cl
    mov edx,offset msg2
    call writestring
    call writedec
    jmp no
nope:
    inc cl
    add esi,4
    cmp cl,col
    jne L2
    inc ch
    cmp ch,row
    jne L1
no:
    exit
main ENDP
END main
