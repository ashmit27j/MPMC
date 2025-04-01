DATA SEGMENT
    var1 DB 11H       ; First 8-bit number (var1 = 0x11)
    var2 DB 11H       ; Second 8-bit number (var2 = 0x11)
    mult DW ?         ; 16-bit variable to store the result
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA      ; Load data segment address
    MOV DS, AX        ; Set DS to point to DATA segment

    MOV AL, var1      ; Load first number (var1) into AL (AL = 0x11)
    MOV BL, var2      ; Load second number (var2) into BL (BL = 0x11)

    MUL BL            ; Multiply AL by BL (AX = AL × BL)
                      ; Result is stored in AX (16-bit output)

    MOV mult, AX      ; Store the result in 'mult' (16-bit variable)

    MOV AX, 4C00H     ; Exit program
    INT 21H           ; DOS interrupt for program termination

CODE ENDS
END START
