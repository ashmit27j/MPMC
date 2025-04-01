DATA SEGMENT
    var1   DW 1000H    ; First 16-bit number (var1 = 0x1000 = 4096 in decimal)
    var2   DW 0AAAH    ; Second 16-bit number (var2 = 0x0AAA = 2730 in decimal)
    diff   DW ?        ; To store the result of subtraction
    borrow DB 00H      ; To store borrow (0 if no borrow, 1 if borrow)
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA       ; Load data segment address
    MOV DS, AX         ; Set DS to point to DATA segment

    MOV AX, var1       ; Load first number into AX
    MOV BX, var2       ; Load second number into BX

    SUB AX, BX         ; AX = var1 - var2

    JNC NO_BORROW      ; If no borrow, jump to NO_BORROW
    MOV borrow, 01H    ; If borrow occurs, set borrow = 1

    NO_BORROW:
    MOV diff, AX       ; Store the result in 'diff'

    MOV AX, 4C00H      ; Exit program
    INT 21H            ; DOS interrupt for termination

CODE ENDS
END START
