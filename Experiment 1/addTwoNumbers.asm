;program to add two 16 bit numbers
;db define byte - 18 bit
;dw define word - 16 bit
;dd define word - 32 bit
;0H or ? is used when we want an empty value
;H is used to say that it is a hexadecimal
;assume is used to tell the assembler in what order and where should which segment be present
;in this case, we need to tell the assembler that thte info segment should be inside the code segment
;assume ds: info, cs: code
;the address of the segments are unknown to the processor, currently only the assembler knows
;we need to pass the address to the BIH so that it can be processed by the processor and act upon the data
;start:
;mov ax, info (moves the starting info into ax)
;mov ds, ax
;mov destination source
;we move source to destination by doing so
;ax, bx are all general purpose registers for storing data
;as, bs, ds are all segment registers for storing segment address
;mov ax, a (moving value of a to ax)
;mov bx

;jc - jump to x line if carry is generated
;jnc - jump to x line if no carry is generated

;jc xyz - jump to xyz if carry is generated
;lorem
;ipsum
;doloret
;xyz: mov carry, 01H
;moves 1H to carry variable

;jnc

info segment
a dw 0AAAAH
b dw 1234H
sum dw ?
carry db ?
info ends

code segment
assume ds: info, cs: code
;the above line tells the assembler that
;info segment should be stored in data segment
;code segment should be stored in cs

start:
mov ax, info
mov ds, ax
mov ax, a
mov bx, b
add ax, bx

jnc carrycondition
mov carry, 01H
carrycondition: mov sum, ax
mov ax, 4C00H
INT 21H
code ends
end start