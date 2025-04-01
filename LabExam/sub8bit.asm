DATA SEGMENT
    var1   DB 10H      ; First 8-bit number (var1 = 0x10 = 16 in decimal)
    var2   DB 20H      ; Second 8-bit number (var2 = 0x20 = 32 in decimal)
    diff   DB ?        ; To store the result of subtraction
    borrow DB 00H      ; To store borrow (0 if no borrow, 1 if borrow)
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA       ; Load data segment address
    MOV DS, AX         ; Set DS to point to DATA segment

    MOV AL, var1       ; Load first number into AL
    MOV BL, var2       ; Load second number into BL

    SUB AL, BL         ; AL = var1 - var2

    JNC NO_BORROW      ; If no borrow, jump to NO_BORROW
    MOV borrow, 01H    ; If borrow occurs, set borrow = 1

    NO_BORROW:
    MOV diff, AL       ; Store the result in 'diff'

    MOV AX, 4C00H      ; Exit program
    INT 21H            ; DOS interrupt for termination

CODE ENDS
END START
