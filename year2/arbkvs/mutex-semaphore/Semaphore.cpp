#include "Semaphore.h"
using std::unique_lock;
using std::mutex;

void Semaphore::acquire()
{
	while (!permit) {
		lock(); 
	}
	permit--;
}

void Semaphore::release()
{
	permit++;
	if (permit > 0)
		unlock();
}

void Semaphore::lock()
{
	unique_lock<mutex> lock(cv_m);
	cv.wait(lock);
}

void Semaphore::unlock()
{
	cv.notify_one();
}
