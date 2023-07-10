
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdbool.h>

bool d0 = true, bD0 = true, bD9 = false;

void init(){
	
	DDRD = 0b00000011;
	PORTD = 0b00001100;
	EIMSK = 0b00000011;
	EICRA = 0b00001010;
	sei();
}

ISR(INT0_vect){
	
	cli();

	PORTD = 0b00001101;
	if(d0){	
		bD0 = !bD0;
	}
	if(!d0){
		bD0 = bD9;
	}

	d0 = true;
	sei();
}

ISR(INT1_vect){
	cli();
	
	PORTD = 0b00001110;
	if(d0){
		bD9=bD0;
	}
	if(!d0){
		bD9=!bD9;
	}
	
	d0 = false;
	sei();
}

int main(void){
	
	init();
	while (1)
	{
		if(d0){
			if(bD0){
				PORTD ^= 0b00001101;
			}
			if(!bD0){
				PORTD = 0b00001101;
			}
		}
		if(!d0){
			if(bD9){
				PORTD ^= 0b00001110;
			}
			if(!bD9){
				PORTD = 0b00001110;
			}
		}
		
		_delay_ms(200);
	}
}
