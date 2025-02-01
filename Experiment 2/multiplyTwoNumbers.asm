; Program to multiply two 16-bit numbers

info segment
    a dw 0000H    ; First operand
    b dw 1234H     ; Second operand
    product dw 0   ; Variable to store multiplication result
info ends

code segment
assume ds: info, cs: code

start:
    mov ax, info  ; Load data segment address into AX
    mov ds, ax    ; Set DS to point to the info segment

    mov ax, a     ; Load first operand into AX
    mov bx, b     ; Load second operand into BX
    mul bx        ; Multiply AX by BX, result stored in DX:AX
    mov product, ax ; Store lower 16 bits of product

    mov ax, 4C00H  ; Terminate program
    INT 21H

code ends
end start
