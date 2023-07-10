
#include "sevenseg.h"
#include "keys.h"
#include <util/delay.h>

void port_init()
{
	DDRD = 0b01111111; 
	DDRB = 0b00000001; 
	DDRC = 0b00000000;
	PORTB |= 0b10; 
	PORTC |= 0b10; 
	
	PCMSK0 = 0b10; 
	PCMSK1 = 0b10; 
	PCICR = 0b11; 
}

int main(void)
{
	port_init();
	timer_init();
	sei();
	
	while (1)
	{	
		num_init(getNum()%10); 
		waitFor(1);
		PORTB^=0x01;
		num_init(getNum()/10);
		waitFor(1);
		PORTB^=0x01;
	}
}

