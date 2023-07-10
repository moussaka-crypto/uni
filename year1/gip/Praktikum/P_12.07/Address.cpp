#include <iostream>
#include "Address.h"

bool Address::scan()
{
	std::cout << "Nachname, Vorname: ";
	std::getline(std::cin, name); 

	std::cout << "Strasse mit Hausnr.: ";
	std::getline(std::cin, street); 

	std::cout << "Postleitzahl Stadt: ";
	std::getline(std::cin, city); 

	std::cout << "Land: ";
	std::getline(std::cin, country); 
		if (get_country() == "") { set_country("DE"); }

	return is_valid();
}

std::ostream& operator<<(std::ostream& p_stream, const Address& a)
{
	if (a.is_valid()) {
		p_stream << a.get_name() << std::endl << a.get_street() << std::endl << a.get_city() << std::endl << a.get_country();
	}
	return p_stream;
}
