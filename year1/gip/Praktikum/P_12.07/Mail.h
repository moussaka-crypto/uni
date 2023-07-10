#pragma once
#include "Address.h"

class Mail {
protected:
	int ID;
	Address from;
	Address to;
	bool delivered;
public:
	int get_id() const { return ID; }
	Address where_from() const { return from; }
	Address where_to() const { return to; }
	bool is_delivered() const { return delivered; }

	void set_ID(int i) { ID = i; }
	void set_status(bool del) { delivered = del; }

	void go_from(Address A) { 
		if (A.scan() == true) from = A;
	}
	void go_to(Address B) {
		if (B.scan() == true) to = B; 
	}

	Mail(int id) : ID{ id } {}
	Mail(int id, Address a, Address b) : ID{id}, from{a}, to{b} {}

	bool deliver();
	bool scan_to();
	bool scan_from();
	virtual std::string delivery_text() const;
};

std::ostream& operator<<(std::ostream& stream, const Mail& m);