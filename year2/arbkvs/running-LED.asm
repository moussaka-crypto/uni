.include "m328pdef.inc" 
.org 0

.equ null = 0x00
.equ allBits = 0xff
.equ fs = 0x03
.equ first = 0x01
.equ last = 0x80

.def mainReg = r16
.def loop1 = r19
.def loop2 = r18
.def loop3 = r17
.def cnt = r20

main:
 ldi mainReg, LOW( RAMEND )
 out SPL, mainReg
 ldi mainReg, HIGH( RAMEND )
 out SPH, mainReg

 ldi mainReg, allBits
 out DDRD, mainReg
 ldi mainReg, fs
 out DDRB, mainReg

 ldi mainReg, first
 out PORTD, mainReg
 rcall delay

start:
 goleft:
 lsl mainReg
 out PORTD, mainReg
 brcs carry
 rcall delay
 rjmp goleft

 carry:
 ldi mainReg, first
 out PORTB, mainReg
 rcall delay

 lsl mainReg
 out PORTB, mainReg
 rcall delay

 lsr mainReg
 out PORTB, mainReg
 rcall delay

 ldi mainReg, null
 out PORTB, mainReg

 ldi mainReg, last
 out PORTD, mainReg
 rcall delay

 ldi cnt, 7
loop:
 lsr mainReg
 out PORTD, mainReg
 rcall delay
 dec cnt
 brne loop
 rjmp start

delay: 
    ldi  loop3, 17
    ldi  loop2, 60
    ldi  loop1, 204

L1: dec  loop1
    brne L1
    dec  loop2
    brne L1
    dec  loop3
    brne L1
	ret