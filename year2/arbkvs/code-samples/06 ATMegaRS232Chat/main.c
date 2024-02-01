/*
 * ATMegaRS232Chat.c
 *
 * master sends keys to client. Client switches LEDs according to key
 * master receives LED status and lights LEDs accordingly
 *
 * Configuration of master and worker is done by pulling bit 0 on PortC
 * high (client) or low (master)
 *
 * Update for new ARBKVS Board 20200818
 * Note: The connections to the RX Pins must be directly on the Arduino
 *       The ARBKVS Board has a push-pull stage between PortD0/D1 and its wiring 
 *	     pins so that the input (RX) cannot be used.
 */ 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdbool.h>

#include "init.h"
#include <util/delay.h>

volatile uint8_t ledStatus = 0xFF; // LEDs on (0xff) or off (0x00)
volatile uint8_t counter = 0x06;
volatile uint8_t value = 0x00;
const uint8_t maxLoops = 0xFF; // blink with delay

void transmitData(uint8_t data);

/*
 * Counts LED state that is then transmitted to the Master board
 */
ISR(TIMER0_OVF_vect)
{
	TCNT0 = 0x00;				// reset counter register
	counter++;					// increment loop count
	if (counter >= maxLoops)	// change status only if max loops reached
	{
		//ledStatus ^= 0xff;	// blink other leds with invert
		counter = 0x00;
	}
}

/*
 * USART receive ISR. Take the byte from the usart register
 * and write it to PortB (LEDs indicating the result)
 */
ISR(USART_RX_vect)
{
	ledStatus = UDR0;
	outputPort = (ledStatus >> 3);
}

/* 
 * ISR if key0 was pressed. In that case, switch the leds on the client
 * to OFF state
 * Keys work only in Master mode. In worker mode this is nop
 */
ISR(INT0_vect)
{
	if (!isWorker())
	{		
		_delay_ms(10); // ignore further triggers (debouncing)
		if (value<5)
		{
			value++;
		}
		outputPort = (1<<value);
		transmitData(1<<value);
	}
	EIFR = (1<<INT0); // clear pending interrupts
}

/* 
 * ISR if key1 was pressed. In that case, switch the leds on the client
 * to ON state
 * Keys work only in Master mode. In worker mode this is nop
 */
ISR(INT1_vect)
{
	if (!isWorker())
	{
		_delay_ms(10); // ignore further triggers (debouncing)
		if (value>0)
		{
			value--;
		}
		outputPort = (1<<value);
		transmitData(1<<value);
	}
	EIFR = (1<<INT1); // clear pending interrupts
}



/*
 * polling transmission routine
 * wait for the send buffer to become empty and send the data
 */
void transmitData(uint8_t data)
{
	/* Wait for empty transmit buffer = USART Data Register Empty */
	while ( !( UCSR0A & (1<<UDRE0)) );
	/* Put data into buffer, sends the data */
	UDR0 = data;
}


/*
 * returns true, if board is set to worker mode
 * for putting a board into master mode pin  
 * on PortC must be pulled to GND
 */
bool isWorker()
{
	return (configPin & (1<<configKey)) == (1<<configKey);
}

int main(void)
{
	initialize_application();

	outputPort = 0xff;
	while (1)
	{
		// in worker mode, we set the current ledStatus on the PortB pins
		// and transmit the current status back to the master 
		if (isWorker())
		{
			outputPort = ledStatus;
			transmitData(counter);
		}
		else
		{
			// in Master mode: Do nothing (will all be handled in the ISR)	
		}
	}
}

