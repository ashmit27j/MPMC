DATA SEGMENT
    array1 DB 01H, 02H, 03H, 04H, 05H  ; Array with 5 elements
    result DB ?                        ; Variable to store largest number
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA     ; Load data segment address
    MOV DS, AX       ; Move it into DS register

    MOV CX, 0005H    ; Loop counter (5 elements)
    MOV BX, 0000H    ; Index counter (BX = 0)
    MOV AL, 00H      ; Store largest number (initialized to 0)

HERE:
    CMP AL, [array1 + BX]   ; Compare AL with current array element
    JNC DOWN                ; If AL >= array1[BX], jump to DOWN
    MOV AL, [array1 + BX]   ; Else, update AL with new max
    DOWN: INC BX            ; Move to the next element
LOOP HERE                   ; Repeat until CX = 0

    MOV result, AL  ; Store the largest value in 'result'

    MOV AX, 4C00H   ; Exit program
    INT 21H

CODE ENDS
END START
