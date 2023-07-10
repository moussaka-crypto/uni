
#include "keys.h"

volatile uint32_t num = 0;
int getNum() {return num;}

ISR(PCINT0_vect)
{
	cli();
	if((PINB & 0b10) == 0)
	{
		if(num<99) num++;
	}
	sei();
}

ISR(PCINT1_vect)
{
	cli();
	if((PINC & 0b10) == 0)
	{
		if(num>0) num--;
	}
	sei();
}

volatile uint32_t timerCounter = 0;

void waitFor(uint32_t ms){
	
	uint32_t ende = timerCounter + ms;
	
	while(timerCounter != ende);
}

void waitUntil(uint32_t ms){
	
	while(timerCounter != ms);
	timerCounter = 0;
}

void timer_init()
{

	TCCR0A = (1 << WGM01);
	TCCR0B |= (1 << CS02);
	OCR0A = CTC_OVERFLOW - 1;
	
	TIMSK0 |= (1 << OCIE1A);
}

ISR(TIMER0_COMPA_vect){	
	cli();
	timerCounter++;
	sei();
}