#pragma once
#include <iostream>
#include <fstream>
#include <string>

int generate_unique_id()
{
	static int count = 0;
	return ++count; //count++;
}

class Logged_Object {
private:
	int id;
	int int_attribut;
	std::ofstream file;

	std::string generate_filename() const 
	{return std::string("obj_") + std::to_string(id) + std::string(".txt");}

	void log(std::string text);

	//void log_cpp(std::string text);

public:
	// Default-Konstruktor (Prototyp) ...
	Logged_Object();

	// Destruktor (Prototyp) ...
	~Logged_Object();

	// Copy-Konstruktor (Prototyp) ...
	Logged_Object(const Logged_Object& orig);

	// Assignment-Operator (Prototyp) ...
	Logged_Object& operator = (const Logged_Object& orig);

};