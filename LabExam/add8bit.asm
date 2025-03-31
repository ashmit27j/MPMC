data segment
    var1 db 01H
    var2 db 01H
    carry db ?
    sum db ?
data ends

code start
    assume ds: data, cs: code
    mov ax, data
    mov ds, ax

    start:
    mov al, var1
    mov bl, var2
    add al, bl

    jnc whenNoCarry 
    mov carry, 01H
    whenNoCarry: mov sum, al

    mov ax, 4C00H
    INT 21H
code ends
end start
    