#pragma once
class CharListenKnoten {
private: //12.01
	char data;
	CharListenKnoten* next;
	int my_id;

public:
	char get_data() { return data; }
	void set_data(char data) { this->data = data; }

	CharListenKnoten* get_next() { return next; }
	void set_next(CharListenKnoten* next) { this->next = next; }

	static int next_available_id; //12.02 IDs
	int get_my_id() { return my_id; }

	static int object_count; //12.03 Zaehler

	CharListenKnoten(char wert) : data{ wert }
	{ 
		next = nullptr; //Defaultwert 
		my_id = next_available_id; //12.02
		next_available_id++;
		object_count++; //12.03
	}
	~CharListenKnoten() {object_count--;} //12.03
};

void hinten_anfuegen(CharListenKnoten*& anker, const char wert); //12.04
void loesche_alle(CharListenKnoten*& anker); //12.05
CharListenKnoten* deep_copy(CharListenKnoten* orig); //12.06