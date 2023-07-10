/*
 * init.h
 *
 * initialization routines and definitions
 *
 * Created: 09.11.2018 16:42:58
 *  Author: ie4938e
 */ 


#ifndef INIT_H_
#define INIT_H_

#define key0 PD2
#define key1 PD3
#define keyPort PORTD
#define keyPortDDR DDRD
#define keyPin PIND

#define configKey PC2
#define configPort PORTC
#define configPortDDR DDRC
#define configPin PINC

#define outputPortDDR DDRB
#define outputPort PORTB


#define F_CPU 16000000 // Clock Speed, use external OSC, no divide
#define BAUD 2400
#define MYUBRR F_CPU/16/BAUD-1

void initialize_application();
bool isWorker();

#endif /* INIT_H_ */