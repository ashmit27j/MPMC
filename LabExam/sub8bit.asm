data segment
    var1 db 10H
    var2 db 20H
    var diff ?
    var borrow ?
data ends

code segment
    assume ds: data, cs: code
    mov ax, data
    mov ds, ax

    start:
    mov al, var1 ;storing variable 1 in al
    mov bl, var2 ;
    sub al, bl

    jnc whenNoBorrow ;when no borrow jump to WhenNoBorrow statement
    mov borrow, 01H ;when there is borrow it will put 01H into borrow
    whenNoBorrow: mov diff, al ;when there is no borrow it will store ans in diff
    mov ax, C400H ;clearing out ax
    INT 21H
code ends
end start