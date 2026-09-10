; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : String Operations
; Task 3     : Implement the following pseudo-code.
;   y is a signed BYTE (user input), i is an unsigned BYTE.
;   for (i=0; i<=5; i++) {
;       if (i<=3) { y = y+2; }
;       if (y==5) { y = y+4; }
;   }
; ================================================================

INCLUDE Irvine32.inc

.data
y SBYTE ?
i BYTE ?

.code
main PROC
    call ReadInt
    mov y, al

    mov i, 0
for_loop:
    cmp i, 6
    jge end_loop

    cmp i, 3
    jbe if_block1
    jmp else_block1

if_block1:
    add y, 2
    jmp end_if_block1

else_block1:
    cmp y, 5
    jne end_if_block1
    add y, 4

end_if_block1:
    inc i
    jmp for_loop

end_loop:
    movzx eax, y
    call WriteInt
    call Crlf

    call WaitMsg
    exit
main ENDP
END main
