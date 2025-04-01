DATA SEGMENT
    array1 DB 01H, 02H, 03H, 04H, 05H  ; Array with 5 elements
    smallest DB ?                      ; Variable to store the smallest number
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA      ; Load data segment
    MOV DS, AX

    MOV CX, 0005H     ; Loop counter (5 elements)
    MOV BX, 0000H     ; Index counter (BX = 0)
    MOV AL, [array1]  ; Assume first element is smallest

HERE:
    CMP AL, [array1 + BX]  ; Compare AL with current array element
    JBE DOWN               ; If AL ≤ array1[BX], skip updating
    MOV AL, [array1 + BX]  ; Else, update AL with the new smallest number
    DOWN:INC BX            ; Move to the next element
LOOP HERE                  ; Repeat until CX = 0

    MOV smallest, AL  ; Store the smallest value in 'smallest'

    MOV AX, 4C00H  ; Exit program
    INT 21H

CODE ENDS
END START
