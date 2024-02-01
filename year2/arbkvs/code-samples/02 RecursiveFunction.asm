.include "m328pdef.inc"

.org 0x00; on reset just restart

start:
	; stack pointer initialization
    ldi r16, LOW(RAMEND)             ; LOW-Byte highest RAM Adress
    out SPL, r16
    ldi r16, HIGH(RAMEND)            ; HIGH-Byte highest RAM Adress
    out SPH, r16

application:
	ldi r16, 3
	rcall sum

    rjmp done

sum: 
	push r16
	dec r16
	breq end
	rcall sum
end: 
	pop r17
	add r16, r17
	ret

done: 
	rjmp done						; Infinite loop to avoid �C reset
