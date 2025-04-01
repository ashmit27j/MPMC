DATA SEGMENT
    block1 DB 10 DUP (01H)  ; Define an array of 10 bytes, all initialized to 01H
DATA ENDS

EXTRA SEGMENT
    block2 DB 10 DUP (?)    ; Define an array of 10 bytes, uninitialized
EXTRA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE, ES:EXTRA

START:
    MOV AX, DATA       ; Load data segment address
    MOV DS, AX         ; Set DS to point to DATA segment

    MOV AX, EXTRA      ; Load extra segment address
    MOV ES, AX         ; Set ES to point to EXTRA segment

    MOV CX, 000AH      ; Set CX = 10 (number of bytes to copy)

    LEA SI, block1     ; Load offset address of block1 into SI (source index)
    LEA DI, block2     ; Load offset address of block2 into DI (destination index)

    CLD                ; Ensure forward copying (clear direction flag)

    REP MOVSB          ; Copy CX bytes from DS:[SI] to ES:[DI]

    MOV AX, 4C00H      ; Exit program
    INT 21H            ; DOS interrupt for termination

CODE ENDS
END START
