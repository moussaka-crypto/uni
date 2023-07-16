;
; SimpleAssemblerProgramm.asm
;
; Created: 10.10.2018 10:55:20
; Author : ie4938e
;
.include "m328pdef.inc"	; Prozessordefinitionen laden

.org 0x000		; Reset Vector
	rjmp start
; Rest der Tabelle bleibt ungenutzt (oder .ORG INT_VECTORS_SIZE nutzen)

start:
	; stack pointer initialization
    ldi r16, LOW(RAMEND)             ; LOW-Byte highest RAM Adress
    out SPL, r16
    ldi r16, HIGH(RAMEND)            ; HIGH-Byte highest RAM Adress
    out SPH, r16

	; PB0, PB1 als Output
	ldi r16, 0b00000011
	out DDRB, r16
	
main:
	in r16, PORTB	; PORTB lesen
	ldi r17, 1		; 1 in r17 laden
	eor r16, r17	; Bit0 in r16 negieren
	out PORTB, r16	; PORTB schreiben
	rcall delayAlt1	; Kleine Pause (Unterprogramm)
	rjmp main		; Sprung zu main -> Schleife

delayAlt1:
	nop				; Pause
	ret				; Rücksprung

delayAlt2:
	ldi r18, 2
cont:
	dec r18
	brne cont
	ret

delayAlt3:
; Sie können gerne den Generator nutzen, 
; müssen den Code aber erklären können!

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 15 999 996 cycles
; 999ms 999us 750 ns at 16 MHz

    ldi  r18, 82
    ldi  r19, 43
    ldi  r20, 0
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1

	ret			; Das ret nicht vergessen!