#pragma once
#include <string>

class RingNode {
private:
	int oldAge;
	std::string description;
	std::string symbolicData;
	RingNode* next;	
public:
	RingNode() : 
		oldAge{ 0 }, description{ "" }, symbolicData{ "" }, next{ nullptr } {}

	RingNode(int age, std::string desc, std::string data) :
		oldAge{ age }, description{ desc }, symbolicData{ data }, next{ nullptr } {}

	int getAge()const { return this->oldAge; }
	void setAge(int a) { this->oldAge = a; }
	std::string getDescription()  { return this->description; }
	void setDescription(std::string des) { this->description = des;}
	std::string getData() { return this->symbolicData; }
	void setData(std::string dat) { this->symbolicData = dat; }
	RingNode* getNext() const { return this->next; }
	void setNext(RingNode* nxt) { this->next = nxt; }
	//Getter und Setter verfuegbar, also keine Speicherbelegung mit Konstruktor
};
