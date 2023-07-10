#include <iostream>
#include <iomanip>
#include <thread>
#include <chrono>
#include <cstdint>

using namespace std;

volatile uint64_t shared;

void f_t0()
{
	uint8_t* locShared = (uint8_t*)(&shared);
	for (;;)
	{
#ifdef NEVER
		shared = 0xBADC0DEDDEADC0DE;
#endif
		// Leave nothing to chance: Provoke a race condition
		// by yielding after each byte-write
		locShared[0] = 0x11;
		this_thread::yield();
		locShared[1] = 0x11;
		this_thread::yield();
		locShared[2] = 0x11;
		this_thread::yield();
		locShared[3] = 0x11;
		this_thread::yield();
		locShared[4] = 0x11;
		this_thread::yield();
		locShared[5] = 0x11;
		this_thread::yield();
		locShared[6] = 0x11;
		this_thread::yield();
		locShared[7] = 0x11;
		this_thread::yield();
	}
}

void f_t1()
{
	uint32_t* locShared = (uint32_t*)(&shared);
	for (;;)
	{
#ifdef NEVER
		shared = 0xC0CAC01AADD511FE;
#endif
		locShared[0] = 0x00000000;
		locShared[1] = 0x00000000;
		this_thread::yield();
	}
}

void f_t2()
{
	for (;;)
	{
		if ((shared != 0x0000000000000000) && (shared != 0x1111111111111111))
		{
			cout << "race condition detected " << setfill('0') << setw(16) << hex << shared << endl;
		}
	}
}


int main(void)
{
	auto t0 = thread(f_t0);
	auto t01 = thread(f_t0);
	auto t02 = thread(f_t0);
	auto t03 = thread(f_t0);
	auto t1 = thread(f_t1);
	auto t2 = thread(f_t2);

	// Threads are running async now
	// wait for completion (that never happens)
	// otherwise, we would just return 0 and exit
	t0.join();
	t01.join();
	t02.join();
	t03.join();
	t1.join();
	t2.join();

	return 0;
}