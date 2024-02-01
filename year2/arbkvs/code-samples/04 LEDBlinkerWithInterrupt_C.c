/*
 * LEDBlinkerWithInterrupt_C.c
 *
 * ATMega328p
 *
 */ 
#include <avr/io.h>
#include <avr/interrupt.h>

// include "m328pdef.inc" entf�llt, Properties definieren Ger�tetyp und 
// io.h / interrupt.h setzen dies richtig um

const uint8_t numWaits = 10;
uint8_t ledStatus = 0xFF; // LEDs an (0xff) oder aus (0x00)
uint8_t counter = 0;

ISR(TIMER0_OVF_vect)
{
	counter++;
	TCNT0 = 0x7F; // Z�hlregister initialisieren

	if (counter >= numWaits)
	{
		ledStatus ^= 0xFF;
		counter = 0;
	}	
}

void initialize_application()
{
	//DDRB = 0xFF; // Alle Pins von PortB als Ausgang schalten
	DDRD = 0xFF; // Alle Pins von PortD als Ausgang schalten

	counter = 0;
}

void initialize_timer()
{
	cli();
	TCCR0B &= 0b11111000;				// L�sche Bits 0-2 (Timer stopped)
	TCCR0B |= ((1<<CS02) | (1<<CS00));	// CS00 und CS02 setzen: Teiler 1024
	TCNT0 = 0x00;						// Z�hlregister initialisieren
	TIMSK0 |= (1<<TOIE0);				// Interrupt maskieren
	sei();
}

int main(void)
{
	initialize_application();
	initialize_timer();
	
    while (1) 
    {
		// Wechselblinker
		//PORTB = ledStatus;
		PORTD = ~ledStatus;
    }
}
