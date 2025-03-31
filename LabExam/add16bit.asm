data segment
    var1 dw 0001h
    var2 dw 0002h
    sum dw ?
    carry dw ?
data ends

code segment
    assume ds: data, cs: code
    mov ax, var1
    mov bx, var2
    add ax, bx
    jnc whenNoCarry
    mov carry, 01H
    whenNoCarry: mov sum, ax
    mov ax, 4C00H
    INT21H
code ends
end start