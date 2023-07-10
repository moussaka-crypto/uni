#include "MyString2.h"
#include <string>

unsigned int MyString2::length() const
{
	int length = 0;
	if (anker == nullptr) return length;
	else {
		CharListenKnoten* ptr = anker;
		while (ptr != nullptr)
		{
			length++; //zaehlt die Laenge des Worts
			ptr = ptr->get_next(); //auf naechstes Zeichen zeigen
		}
		return length;
	}
}

char MyString2::at(unsigned int pos) const
{
	int counter = 0; //Spiegel des pos Parameters
	char symbol = '\0';
	if (anker == nullptr) return symbol;
	else {
		CharListenKnoten* ptr = anker;
		while (ptr != nullptr)
		{
			if (counter == pos) { symbol = ptr->get_data(); }
			counter++;
			ptr = ptr->get_next();
		}
		return symbol;
	}
}

std::string MyString2::to_string() const
{
	std::string copy = "";
	if (anker == nullptr) return copy;
	else {
		CharListenKnoten* ptr = anker;
		while (ptr != nullptr)
		{
			copy += ptr->get_data(); 
			ptr = ptr->get_next(); //auf naechsten char setzen 
		}
		return copy;
	}
}

MyString2 MyString2::operator+ (char c) const
{
	MyString2* ptr = new MyString2(*this); //this bezieht sich auf das aktuelle Objekt
	hinten_anfuegen(ptr->anker, c); //ptr auf anker des MyString2 Objekts und hinzufügender char
	return *ptr;
}
