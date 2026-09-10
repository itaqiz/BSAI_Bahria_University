; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab # 11   : String Procedures - INVOKE and ADDR
; Task 2     : Write a program using The AddTwo procedure that
;              receives two integers and returns their sum in EAX.
;              - Use CALL operation to call the procedure "AddTwo"
;              - Use INVOKE operation to call the procedure "AddTwo"
; ================================================================

INCLUDE Irvine32.inc

.data
v1  DWORD 10
v2  DWORD 20
msg BYTE "Sum is", 0

.code
TheAddTwo PROC
    add eax, ebx
    call writeint
    ret
TheAddTwo ENDP

main PROC
    mov eax, v1
    mov ebx, v2

    ; Version 1: using CALL
    call TheAddTwo
    call crlf

    ; Version 2: using INVOKE
    mov eax, v1
    mov ebx, v2
    invoke TheAddTwo

    exit
main ENDP
END main
