; This file contains the assembler opcodes for ATMega8 in comments
; The current version is written for ATMega328p

; ATMega8: .include "m8def.inc"
.include "m328pdef.inc"

; register aliases
.def temp = r16
.def ledstatus = r17
.def counter = r18

; constant definitions
.equ numwaits = 10					; Die Warteschleife numwaits mal durchlaufen,
									; bevor der LED Zustand sich �ndert

.org 0x0000
	rjmp    main                  	; Reset Handler
.org OVF0addr						; Adresse f�r den Interruptvektor
    rjmp    timer0_overflow       	; Adresse f�r den Timer Overflow Handler

main:
	; Stackpointer initialisieren (f�r rcall und ISR zwingend erforderlich)
    ldi		temp, HIGH(RAMEND)
    out     SPH, temp
    ldi     temp, LOW(RAMEND)
    out     SPL, temp
	
	rcall	init_application
	rcall	init_timer				; Initialisierungsroutine (Takt, Modus, Interrupts)

main_loop:
   	rjmp    main_loop				; Hauptschleife, hier passiert nichts mehr


init_application:
    ldi     temp, 0xFF				; 8 LEDs an PORT D
    out     DDRD, temp

	ldi     ledstatus, 0xFF			; LEDs initial an (High)				
	ldi     counter, 0				; Z�hlregister auf 0
	ret


init_timer:
	cli								; Interrupts global deaktivieren
									; Prescaler konfigurieren
	in		temp, TCCR0B			; ATMega8: in		temp, TCCR0
	cbr     temp, 0b00000111		; L�sche Bits 0-2 (Timer stopped)
	sbr     temp, 0b00000101		; CS00 und CS02 setzen: Teiler 1024
									; 16 MHz / 1024 = 15,625 kHz
									; -> TCNT0 wird mit 15,625 kHz um 1 inkrementiert
    out     TCCR0B, temp			; ATMega8: out     TCCR0, temp

	ldi		temp, 0x00
	out		TCNT0, temp				; Z�hlregister initialisieren
   	ldi     temp, (1<<TOIE0)      	; TOIE0: Interrupt bei Timer Overflow
    sts     TIMSK0, temp			; ATMega8: out     TIMSK, temp		; Interrupt maskieren
	sei								; Interrupts global aktivieren
	ret

timer0_overflow:                    ; Timer 0 Overflow Handler, (CLI ist implizit)
	ldi		temp, 0x7F				; Compare-Interrupt w�re hier einfacher
	out		TCNT0, temp				; Z�hlregister initialisieren   
    inc     counter
	cpi     counter, numwaits		; Oft genug gewartet
	brlo    endSub					; Nein? Dann weiterz�hlen 
									; ohne den LED Status zu �ndern
	out     PORTD, ledstatus		; LED Status ausgeben 
    com     ledstatus				; LED Status �ndern
	ldi     counter, 0				; Z�hler zur�cksetzen
endSub: 
	reti							; Beende die ISR (SEI ist implizit)