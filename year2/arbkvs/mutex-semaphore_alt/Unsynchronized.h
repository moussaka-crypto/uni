#pragma once
#include <iostream>
#include <string>
#include "Output_Type.h"

void thread_1_un(std::string &output) {
	output = kleinbuchstaben();
	std::cout << output;
}

void thread_2_un(std::string& output) {
	output = zahlen();
	std::cout << output;
}

void thread_3_un(std::string& output) {
	output = grossbuchstaben();
	std::cout << output;
}
