; Program to divide two 16-bit numbers

info segment
    a dw 0AAAAH    ; Dividend
    b dw 1234H     ; Divisor
    quotient dw 0  ; Variable to store division result
    remainder dw 0 ; Variable to store remainder after division
info ends

code segment
assume ds: info, cs: code

start:
    mov ax, info  ; Load data segment address into AX
    mov ds, ax    ; Set DS to point to the info segment

    mov ax, a     ; Load dividend into AX
    mov dx, 0     ; Clear DX (for 32-bit division, DX:AX is used as dividend)
    mov bx, b     ; Load divisor into BX
    div bx        ; AX = AX/BX, DX = AX%BX
    mov quotient, ax  ; Store quotient
    mov remainder, dx ; Store remainder

    mov ax, 4C00H  ; Terminate program
    INT 21H

code ends
end start
