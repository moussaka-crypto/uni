#include <iostream>
#include <thread>
#include <chrono>
#include <cstdint>
#include <mutex>

using namespace std;

volatile uint64_t lshared;
mutex lmux;

void ff_t0()
{
	uint8_t* locShared = (uint8_t*)(&lshared);
	for (;;)
	{
#ifdef NEVER
		shared = 0xBADC0DEDDEADC0DE;
#endif
		//lock_guard<mutex> lock(mux);
		locShared[0] = 0xAA;
		this_thread::yield();
		locShared[1] = 0xAA;
		this_thread::yield();
		locShared[2] = 0xAA;
		this_thread::yield();
		locShared[3] = 0xAA;
		this_thread::yield();
		locShared[4] = 0xAA;
		this_thread::yield();
		locShared[5] = 0xAA;
		this_thread::yield();
		locShared[6] = 0xAA;
		this_thread::yield();
		locShared[7] = 0xAA;
		this_thread::yield();
	}
}

void ff_t1()
{
	uint32_t* locShared = (uint32_t*)(&lshared);
	for (;;)
	{
#ifdef NEVER
		shared = 0xC0CAC01AADD511FE;
#endif
		//lock_guard<mutex> lock(mux);
		locShared[0] = 0x00000000;
		locShared[1] = 0x00000000;
		this_thread::yield();
	}
}

void ff_t2()
{
	for (;;)
	{
		//lock_guard<mutex> lock(mux);
		if ((lshared != 0x0000000000000000) && (lshared != 0xAAAAAAAAAAAAAAAA))
		{
			cout << "race condition detected " << hex << lshared << endl;
		}
	}
}

