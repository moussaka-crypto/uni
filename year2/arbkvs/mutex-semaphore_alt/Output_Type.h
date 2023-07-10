#pragma once
#include<iostream>
#include<string>

std::string kleinbuchstaben() {
	std::string result = "Kleinbuchstaben : ";
	for (int i = 97; i < 123; i++) {
		if (i != 122)
			result = result + (char(i)) + ' ';
		else
			result = result + (char(i)) + '\n';
	}
	return result;
}

std::string grossbuchstaben() {
	std::string result = "Grossbuchstaben : ";
	for (int i = 65; i < 91; i++) {
		if (i != 90)
			result = result + (char(i)) + ' ';
		else
			result = result + (char(i)) + '\n';
	}
	return result;
}

std::string zahlen() {
	std::string result = "Zahlen[0-32] :";
	for (int i = 0; i < 33; i++) {
		if(i != 32)
			result = result + std::to_string(i) + ' ';
		else
			result = result + (char(i)) + '\n';
	}
	return result;
}