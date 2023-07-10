#pragma once
#include <string>
#include <fstream>

class Address {
private:
	std::string name, street, city, country;
public:
	std::string get_name() const { return name; }
	void set_name(std::string n) { name = n; }

	std::string get_street() const { return street; }
	void set_street(std::string str) { street = str; }

	std::string get_city() const { return city; }
	void set_city(std::string ci) { city = ci; }

	std::string get_country() const { return country; }
	void set_country(std::string co) { country = co; }

	Address() : name{ "" }, street{ "" }, city{ "" }, country{ "" } {}
	Address(std::string n, std::string str, std::string c, std::string co = "DE") : name{ n }, street{ str }, city{ c }, country{co} {}

	bool is_valid() const {
		if (name == "" || street == "" || city == "") { return false; } //dirket auf Attribute zugreifen koennen
		return true;
	}

	bool scan();
	friend std::ostream& operator<<(std::ostream& p_stream, const Address& a);
};