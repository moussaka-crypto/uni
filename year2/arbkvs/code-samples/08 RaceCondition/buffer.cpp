#include <iostream>
#include <iomanip>
#include <thread>
#include <chrono>
#include <cstdint>

class Semaphore
{
public:
	Semaphore(uint32_t i) : count(i)
	{
	}

	void acquire()
	{

	}
	void release()
	{

	}

private:
	uint32_t count;
	//...
};

const size_t bufSz = 128;
uint32_t buffer[bufSz];

Semaphore mutex(1);
Semaphore empty(bufSz);
Semaphore full(0);

void insert_item(uint32_t item)
{}
uint32_t remove_item()
{
	return 0;

}

void producer()
{
	uint32_t item = 0;

	while (true)
	{
		empty.acquire();
		mutex.acquire();
		insert_item(item);
		mutex.release();
		full.acquire();
	}
}

void consumer(void)
{
	uint32_t item;

	while (true)
	{
		full.acquire();
		mutex.acquire();
		item = remove_item();
		mutex.release();
		empty.release();
		// ... further processing
	}
}
