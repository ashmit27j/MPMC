@ TMOD: Configures the timer modes for the 8051 microcontroller.
@ ACALL: Calls a subroutine (absolute jump within a 2KB memory range).
@ SCON: Serial Control Register used to configure the serial communication settings.
@ SETB: Sets a specific bit (1) in a given register or memory location.
@ SBUF: Serial Buffer Register used for sending and receiving serial data.
START:
    ; SET TIMER MODE FOR SERIAL COMMUNICATION
    MOV TMOD, #20H         ; CONFIGURE TIMER1 IN MODE 2 (AUTO-RELOAD MODE)
    MOV TH1, #0FAH         ; SET TIMER1 HIGH BYTE (BAUD RATE) TO 0FAH
    MOV SCON, #50H         ; CONFIGURE SERIAL CONTROL REGISTER: 
                           ; MODE 1 (8-bit UART), REN (RECEIVE ENABLE)
    SETB TR1               ; START TIMER1 TO ENABLE SERIAL COMMUNICATION

    ; TRANSMIT EACH CHARACTER IN THE NAME "NEERAV" SEQUENTIALLY
    MOV SBUF, #"N"         ; TRANSMIT 'N' VIA SBUF REGISTER
    ACALL DELAY1           ; CALL DELAY FUNCTION
    ACALL DELAY2           ; CALL DELAY FUNCTION

    MOV SBUF, #"E"         ; TRANSMIT 'E'
    ACALL DELAY1
    ACALL DELAY2

    MOV SBUF, #"E"         ; TRANSMIT 'E'
    ACALL DELAY1
    ACALL DELAY2

    MOV SBUF, #"R"         ; TRANSMIT 'R'
    ACALL DELAY1
    ACALL DELAY2

    MOV SBUF, #"A"         ; TRANSMIT 'A'
    ACALL DELAY1
    ACALL DELAY2

    MOV SBUF, #"V"         ; TRANSMIT 'V'
    ACALL DELAY1
    ACALL DELAY2

; DELAY FUNCTION 1
DELAY1:
WAIT:
    JNB TI, WAIT           ; WAIT UNTIL TRANSMIT INTERRUPT FLAG (TI) IS SET
    CLR TI                 ; CLEAR THE TRANSMIT INTERRUPT FLAG
    RET

; DELAY FUNCTION 2
DELAY2:
    MOV R2, #0AH           ; LOAD R2 WITH 10 (CONTROL DELAY LOOP)
LOOP1:
    MOV R1, #0FAH          ; LOAD R1 WITH 250 (INNER LOOP COUNT)
LOOP2:
    MOV R0, #0FFH          ; LOAD R0 WITH 255 (INNER INNER LOOP COUNT)
WAIT1:
    DJNZ R0, WAIT1         ; DECREMENT R0, LOOP UNTIL R0 BECOMES 0
    DJNZ R1, LOOP2         ; DECREMENT R1, LOOP UNTIL R1 BECOMES 0
    DJNZ R2, LOOP1         ; DECREMENT R2, LOOP UNTIL R2 BECOMES 0
    RET

END