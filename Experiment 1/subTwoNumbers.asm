; Program to subtract two 16-bit numbers
; db - define byte (8-bit)
; dw - define word (16-bit)
; dd - define double word (32-bit)
; 0H or ? is used for an undefined value
; H is used to indicate that the number is in hexadecimal

; Assume that data segment is 'info' and code segment is 'code'
; The assembler will place 'info' in the data segment and 'code' in the code segment

info segment
    a dw 0AAAAH  ; First 16-bit number (a = 0xAAAA)
    b dw 1234H   ; Second 16-bit number (b = 0x1234)
    diff dw ?     ; To store the result of the subtraction
    borrow db ?   ; To store the borrow flag (1H if borrow occurs)
info ends

code segment
assume ds: info, cs: code

start:
    ; Initialize data segment
    mov ax, info      ; Load the address of 'info' segment into AX
    mov ds, ax        ; Move address from AX into DS (data segment)

    ; Load values into registers
    mov ax, a         ; Move value of 'a' into AX register
    mov bx, b         ; Move value of 'b' into BX register

    ; Perform subtraction
    sub ax, bx        ; Subtract the value in BX from AX (AX = AX - BX)

    ; Check for borrow (if borrow occurs, the carry flag will be cleared)
    jc borrowcondition ; Jump to 'borrowcondition' label if carry is set (borrow occurred)

    ; If no borrow, set borrow flag to 0 (no borrow)
    mov borrow, 00H

    ; Jump to save result if no borrow
    jmp saveResult

borrowcondition:
    ; If borrow occurred, set borrow flag to 1 (borrow happened)
    mov borrow, 01H

saveResult:
    ; Store the result (AX) in 'diff' (difference)
    mov diff, ax      ; Move result (AX) to 'diff' variable

    ; Terminate the program
    mov ax, 4C00H     ; Terminate the program (DOS interrupt)
    int 21H           ; Call interrupt 21h to terminate

code ends
end start
