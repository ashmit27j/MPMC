DATA SEGMENT
    var1  DB 01H     ; First 8-bit number (var1 = 0x01)
    var2  DB 01H     ; Second 8-bit number (var2 = 0x01)
    carry DB 00H     ; To store carry (0 if no carry, 1 if carry)
    sum   DB ?       ; To store the sum result
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA      ; Load data segment address
    MOV DS, AX        ; Set DS to point to DATA segment

    MOV AL, var1      ; Load first number into AL
    MOV BL, var2      ; Load second number into BL

    ADD AL, BL        ; Add AL + BL (result stored in AL)

    JNC NO_CARRY      ; If no carry, jump to NO_CARRY
    MOV carry, 01H    ; If carry occurs, set carry = 1

NO_CARRY:
    MOV sum, AL       ; Store sum in 'sum'

    MOV AX, 4C00H     ; Exit program
    INT 21H           ; DOS interrupt to terminate

CODE ENDS
END START
