#pragma once
#include "Mail.h"

enum Category {STANDARD, EXPRESS};

class Letter : public Mail {
private:
	Category ctg;
public:

	Category get_ctg() const { return ctg;}
	void set_stg(Category cat) { ctg = cat; }

	Letter(int id, Category c = STANDARD) : Mail(id), ctg{c} {}
	Letter(int id, Address a, Address b, Category c = STANDARD) : Mail(id, a, b), ctg{c} {}

	std::string delivery_text() const;
};

std::ostream& operator<<(std::ostream& stream, const Letter& l);