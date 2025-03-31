data segment
    var1 dw 1000H
    var2 dw 0AAAH
    diff dw ?
    borrow dw ?
data ends

code segment
    assume ds: data, cs: code
    mov ax, data
    mov ds, ax

    start:
    mov ax, var1
    mov bx, var2
    sub ax, bx

    jnc whenNoBorrow
    mov borrow, 01H
    whenNoBorrow: mov diff, ax

    mov ax, 4C00H
    INT21H
code ends
end start