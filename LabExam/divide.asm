DATA SEGMENT
    VAR1 DW 1000H    ; 16-bit dividend (var1 = 0x1000 = 4096 in decimal)
    VAR2 DB 02H      ; 8-bit divisor (var2 = 0x02 = 2 in decimal)
    QUO  DB ?        ; To store quotient (8-bit)
    REM  DB ?        ; To store REMainder (8-bit)
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA      ; Load data segment address
    MOV DS, AX        ; Set DS to point to DATA segment

    MOV AX, VAR1      ; Load dividend (16-bit) into AX
    MOV DX, 0000H     ; Clear DX (high word of dividend)
                      ; DX:AX = full 16-bit dividend

    MOV BL, VAR2      ; Load divisor (8-bit) into BL

    DIV BL            ; Divide AX by BL
                      ; Quotient → AL
                      ; REMainder → AH

    MOV QUO, AL       ; Store quotient in 'quo'
    MOV REM, AH       ; Store REMainder in 'REM'

    MOV AX, 4C00H     ; Exit program
    INT 21H           ; DOS interrupt for termination

CODE ENDS
END START
