#pragma once
#include<string>
#include "catch.h"
#include"RingNode.h"
//#include <Windows.h>

class Ring {
private:	
	int countNodes;
	RingNode* anker;
public:
	Ring();
	void addNewNode(std::string newDesc, std::string newData);
	bool search(std::string Data);
	void print();
	void print(RingNode* tmp); //Hilfsfkt f�r print();
	
	friend RingNode* get_anker(Ring& r);
	friend int get_countNodes(Ring& r);
};
