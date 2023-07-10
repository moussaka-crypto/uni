
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdbool.h>

void init(){
	
	DDRD = 0b00000011;
	DDRB = 0b00000000;
	PORTB = 0b00000011;
}

int main(void)
{
	init();
	bool d0 = true, bD0 = true, bD9 = true;
	
	while(1)
	{
		if(d0){
			
			if(PINB == 0b00000010){bD0 = !bD0;}
			
			if(bD0){
				PORTD = PIND ^ 0b00000001;
			}
			if(!bD0){
				PORTD = 0b00000001;
			}
		}
		
		if(!d0){
			
			if(PINB == 0b00000001){bD9 = !bD9;}
			
			if(bD9){
				
				PORTD = PIND ^ 0b00000010;
			}
			if (!bD9){
				PORTD = 0b00000010; 
			}
		}
		
		
		if(PINB == 0b00000001){
			
			bD0 = bD9;
			PORTD=0b00000010;
			d0 = false;
		}
		if(PINB == 0b00000010){ 
			
			bD9 = bD0;
			PORTD=0b00000001;
			d0 = true;
		}
		_delay_ms(250);
	}
}