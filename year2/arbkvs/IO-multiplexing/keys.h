
#pragma once
#include <avr/io.h>
#include <avr/interrupt.h>
#define F_CPU 16000000UL
#define CTC_OVERFLOW ((F_CPU/1000) / 256)

void timer_init(void);
void waitFor(uint32_t ms);
