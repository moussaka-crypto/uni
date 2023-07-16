#pragma once
#include <iostream>
#include <string>
#include<mutex>
#include "Output_Type.h"

std::mutex shield;

void thread_1_mutex(std::string& output) {
	shield.lock();
	output = kleinbuchstaben();
	std::cout << output;
	shield.unlock();
}

void thread_2_mutex(std::string& output) {
	shield.lock();
	output = zahlen();
	std::cout << output;
	shield.unlock();
}

void thread_3_mutex(std::string& output) {
	shield.lock();
	output = grossbuchstaben();
	std::cout << output;
	shield.unlock();
}