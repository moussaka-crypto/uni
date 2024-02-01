/*
 * init.c
 *
 * Initialization Routines for the Chat Program
 * 
 */ 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdbool.h>
#include "init.h"
#include <util/delay.h>

void initialize_timer()
{
	cli();
	TCCR0A &= 0b11111100;				// Normal mode of operation
	TCCR0B |= (1<<CS02) | (1<<CS00);	// Clock/1024
	TCNT0 = 0x00;						// Count from 0x00
	TIMSK0 |= (1<<TOIE0);				// Timer overflow interrupt
	sei();
}

/*
 * Initialize INT0 and INT1 to be used.
 * Keys must be connected to the respective Pins on the board
 * PD2 and PD3
 */
void initializeKeyISR()
{
	cli();
	EICRA |= (1<<ISC01 | 1<<ISC11); // falling edge on INT0 or INT1 trigger interrrupt
	EIMSK |= (1<<INT0 | 1<<INT1); // enable INT0 and INT1 interrupts
	sei();
}

/*
 * initialize USART to ubrr baud rate, 8N2
 */
void initialize_USART( unsigned int ubrr)
{
	/*Set baud rate */
	UBRR0H = (unsigned char)(ubrr>>8);
	UBRR0L = (unsigned char)ubrr;
	/* Enable receiver and transmitter */
	
	/* Set frame format: 8data, 2stop bit */
	UCSR0C = (1<<USBS0)|(3<<UCSZ00);
	// Enable Receive, Transmit, Receive Interrupt
	UCSR0B = (1<<RXEN0)|(1<<TXEN0)|(1<<RXCIE0);
}


/*
 * initialize the key Port to be used 
 * as active low input for the two keyboard pins
 */
void initialize_keys()
{
	keyPortDDR &= ~((1<<key0) | (1<<key1));
	keyPort |= 	((1<<key0) | (1<<key1)); // enable internal pullups
}


/*
 * set the IO registers, 
 * initialize I/O devices
 * initialize timers
 * initialize ISR
 */
void initialize_application()
{
	outputPortDDR = 0xFF;	// output for LEDs
	configPortDDR = 0x00;	// input for device configuration
	configPort = 0xFF;   // Enable Pullups (defines if the board works as master or worker
					// For master mode, pull down one pin
	initialize_keys();
	initializeKeyISR();
	initialize_USART(MYUBRR);
	
	// use TOVF interrupt for blinking only on worker side
	if (isWorker())
	{
		initialize_timer();
	}
}
