; ================================================================
; Name       : Muhammad Taqui
; Enrollment : 01-136221-021
; Lab        : String Operations
; Task 4     : Write a program that calculates and displays the
;              Fibonacci sequence {1, 1, 2, 3, 5, 8, 13, ...},
;              getting the number of terms from the user. Display
;              each unsigned decimal integer value on a separate
;              line.
; ================================================================

INCLUDE Irvine32.inc

.data
prompt        BYTE "Enter the number of Fibonacci terms to display: ", 0
fibonacci_msg BYTE "Fibonacci sequence: ", 0
error_msg     BYTE "Error: Number of terms should be at least 2.", 0

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadDec
    mov ecx, eax

    cmp ecx, 2
    jl input_error

    mov edx, OFFSET fibonacci_msg
    call WriteString
    call Crlf

    mov eax, 1
    call WriteInt
    call Crlf
    mov ebx, 1
    call WriteInt
    call Crlf

    mov esi, ecx
    sub esi, 2               ; already printed first 2 terms

fibonacci_loop:
    cmp esi, 0
    jle done

    mov edx, eax
    add eax, ebx
    mov ebx, edx
    call WriteInt
    call Crlf
    dec esi
    jmp fibonacci_loop

    jmp done

input_error:
    mov edx, OFFSET error_msg
    call WriteString

done:
    exit
main ENDP
END main
