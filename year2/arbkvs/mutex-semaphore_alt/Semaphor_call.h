#pragma once
#include<iostream>
#include<string>

#include"Semaphor.h"
#include "Output_Type.h"

Semaphor counting_semaphor(1);

void thread_1_semaphor(std::string& output) {
	counting_semaphor.aquire();
	output = kleinbuchstaben();
	std::cout << output;
	counting_semaphor.release();
}

void thread_2_semaphor(std::string& output) {
	counting_semaphor.aquire();
	output = zahlen();
	std::cout << output;
	counting_semaphor.release();
}

void thread_3_semaphor(std::string& output) {
	counting_semaphor.aquire();
	output = grossbuchstaben();
	std::cout << output;
	counting_semaphor.release();
}