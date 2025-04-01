start :
mov tmod, #20h
mov th1, #0fah
mov scon, #50h
setb tr1
 
mov sbuf, #"N"
acall delay1
acall delay2
 
mov sbuf, #"e"
acall delay1
acall delay2
 
mov sbuf, #"e"
acall delay1
acall delay2
 
mov sbuf, #"r"
acall delay1
acall delay2
 
mov sbuf, #"a"
acall delay1
acall delay2
 
mov sbuf, #"v"
acall delay1
acall delay2

delay1 :
wait : jnb ti, wait
clr ti
 
delay2 :
mov r2, #0ah
loop1 : mov r1, #0fah
loop2 : mov r0, #0ffh
 
wait1 : djnz r0, wait1
djnz r1, loop2
djnz r2, loop1
ret
end
