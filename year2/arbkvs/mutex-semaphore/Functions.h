#pragma once
#define MAX_AVAILABLE 3
#include <iostream>
#include <thread>
#include <mutex>
#include "Semaphore.h"
using std::cout;
using std::thread;
using std::mutex;

void kleinB()
{
	for (char c = 'a'; c <= 'z'; c++) {

		(c != 'z') ?
			cout << c << ' ' :
			cout << c;
	}
	cout << '\n';
}
void num0to32()
{
	for (int i = 0; i < 33; i++)
	{
		(i != 32) ?
			cout << i << ' ' :
			cout << i;
	}
	cout << '\n';
}
void grossB()
{
	for (char c = 'A'; c <= 'Z'; c++)
	{
		(c != 'Z') ?
			cout << c << ' ' :
			cout << c;
	}
	cout << '\n';
}

typedef void (*ThreadFunc[]) ();
ThreadFunc tf = {kleinB, num0to32, grossB};

void threads_noSync()
{
	thread tarr[MAX_AVAILABLE];
	for (int i = 0; i < MAX_AVAILABLE; i++)
		tarr[i] = thread(tf[i]);

	for (int i = 0; i < MAX_AVAILABLE; i++)
		tarr[i].join();
}

namespace mtx {
	mutex m;
	void kleinSync()
	{
		m.lock();
		kleinB();
		m.unlock();
	}
	void numSync()
	{
		m.lock();
		num0to32();
		m.unlock();
	}
	void grossSync()
	{
		m.lock();
		grossB();
		m.unlock();
	}

	typedef void (*MutexThreadFunc[]) ();
	MutexThreadFunc mtf = { kleinSync, numSync, grossSync };

	void threads_Sync()
	{
		thread tarrM[MAX_AVAILABLE];
		for (int i = 0; i < MAX_AVAILABLE; i++)
			tarrM[i] = thread(mtf[i]);

		for (int i = 0; i < MAX_AVAILABLE; i++)
			tarrM[i].join();
	}
}

namespace sem {
	Semaphore s;
	void kleinSync()
	{
		s.acquire();
		kleinB();
		s.release();
	}
	void numSync()
	{
		s.acquire();
		num0to32();
		s.release();
	}
	void grossSync()
	{
		s.acquire();
		grossB();
		s.release();
	}

	typedef void (*SemaphoreThreadFunc[]) ();
	SemaphoreThreadFunc stf = { kleinSync, numSync, grossSync };

	void threads_Sync()
	{
		thread tarrS[MAX_AVAILABLE];
		for (int i = 0; i < MAX_AVAILABLE; i++)
			tarrS[i] = thread(stf[i]);

		for (int i = 0; i < MAX_AVAILABLE; i++)
			tarrS[i].join();
	}
}