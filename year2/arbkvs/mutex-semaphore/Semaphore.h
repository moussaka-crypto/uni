#pragma once
#include <condition_variable>

class Semaphore {
private:
	std::condition_variable cv;
	std::mutex cv_m;
	int count;
public:
	Semaphore() : count{1} {}

	void acquire();
	void release();
	void lock();
	void unlock();
};