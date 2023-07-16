#include <cstdint>

using namespace std;

// global variable which procID might enter the CS
volatile uint32_t procIDCSAllow; 

void p0(void)
{
	static uint32_t procID = 0;
	while (procIDCSAllow != procID)
	{
		; // busy wait
	}
	// do stuff
	procIDCSAllow = 1;
}

void p1(void)
{
	static uint32_t procID = 1;
	while (procIDCSAllow != procID)
	{
		; // busy wait
	}
	// do stuff
	procIDCSAllow = 0;
}

