#include "Semaphor.h"
#include <mutex>
#include <condition_variable>

void Semaphor::aquire() {
	std::unique_lock<std::mutex> lck(m_mux);
	while (count == 0)
		cv.wait(lck);
	count--;
}
void Semaphor::release() {
	std::unique_lock<std::mutex> lck(m_mux);
	count++;
	cv.notify_all();
}