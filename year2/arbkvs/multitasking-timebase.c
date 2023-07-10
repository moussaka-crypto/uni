
#define F_CPU 16000000UL
#define CTC_OVERFLOW ( (F_CPU/1000) / 256)
#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint32_t systemClock = 0;

void waitFor(uint32_t ms){
	
	uint32_t ende = systemClock + ms;
	
	while(systemClock != ende);
}

void waitUntil(uint32_t ms){
	
	while(systemClock != ms);
	systemClock = 0;
}

ISR(TIMER0_COMPA_vect)
{
	cli();
	systemClock++;
	sei();
}

void app_init()
{
	DDRD = 0xFF;
}

void timer_init()
{
	TCCR0A = (1 << WGM01);
	TCCR0B |= (1 << CS02);
	OCR0A = CTC_OVERFLOW - 1;
	
	TIMSK0 |= (1 << OCIE1A);
	sei();
}

int main(void)
{
	app_init(); timer_init();
	while (1)
	{
		waitFor(1000);
		waitUntil(1000);
		PORTD ^= 0xFF;
	}
}