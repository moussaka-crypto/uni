#pragma once
#include <mutex>
#include <condition_variable>

class Semaphor{
private:
	int count;
	std::mutex m_mux;               
	std::condition_variable cv;

public:
	Semaphor(int input_count) : count(input_count){}
	void aquire();
	void release();
};

