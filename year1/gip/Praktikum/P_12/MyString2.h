#pragma once
#include "CharListenKnoten.h"
#include <string>

class MyString2 {
private:
	CharListenKnoten* anker;

public:
	CharListenKnoten* get_anker() { return anker; }
	void set_anker(CharListenKnoten* anker) { this->anker = anker; }

	MyString2() : anker{nullptr} {} // 13.01
	~MyString2() { loesche_alle(anker); } //13.02

	MyString2(std::string zeichenkette) { //13.03 - MyStr2 Obj aus std::string mittels Schleife und hinten_anfuegen
		for (int i = 0; i < zeichenkette.length(); i++)
		{
			hinten_anfuegen(anker, zeichenkette.at(i));
		}
	}

	MyString2(const MyString2& orig) { anker = deep_copy(orig.anker); } // Copy Konstruktor

	MyString2& operator= (const MyString2& anker_ref) { //13.04
		loesche_alle(anker); // Destruktor aufrufen 
		anker = deep_copy(anker_ref.anker); //Kopieren durch Referenz von anker
		return *this; // Das aktuelle Objekt zurückgeben
	}

	//Methoden von MyString2
	unsigned int length() const; //13.05
	char at(unsigned int pos) const; //13.06
	std::string to_string() const; //13.07
	MyString2 operator+(char c) const; //13.08
};