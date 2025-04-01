;Blinking LED;
;DJNZ Decrement and Jump if Not Zero. deecrements value of register and jumps
;SJMP Short Jump
start:

mov p1, #55h
	mov r2, #0ah
		loop1: mov r1, #0ffh
			loop: mov r0, #0ffh
				wait: djnz r0, wait
			djnz r1, loop
		djnz r2, loop1

mov p1, #0aah
	mov r2, #0ah
		loop3: mov r1, #0ffh
			loop2: mov r0, #0ffh
				wait1: djnz r0, wait1
			djnz r1, loop2
		djnz r2, loop3

sjmp start

end