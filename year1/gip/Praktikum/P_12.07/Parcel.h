#pragma once
#include "Mail.h"

class Parcel : public Mail {
private:
	double weight;
	bool insured = false;
public:
	double get_weight() const { return weight; }
	void set_weight(double d) { weight = d; }

	bool get_insured() const { return insured; }
	void set_insured(bool i) { insured = i; }

	Parcel(int id, double w, bool i = false): Mail(id), weight{w}, insured{i} {}
	Parcel(int id, Address a, Address b, double w, bool i = false): Mail(id, a, b), weight{ w }, insured{ i } {}

	std::string delivery_text() const;
};

std::ostream& operator<<(std::ostream& stream, const Parcel& p);