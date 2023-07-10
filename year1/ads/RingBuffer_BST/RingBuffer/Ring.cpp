                                
/*************************************************
* ADS Praktikum 2.1
* Ring.cpp
* Erweiterung um Hilfsfunktionen gestattet.
*************************************************/
// Ring .cpp

#include "Ring.h"
#include <iostream>
using namespace std;



// Ihr Code hier:

Ring::Ring()
{
	anker = new RingNode;
	anker->setNext(anker);
	this->countNodes = 0;
}

void Ring::addNewNode(std::string newDesc, std::string newData)
{
	int ende = this->countNodes; //falls Fkt mehrmals aufgerufen wird

	RingNode* new_el = new RingNode{ 0,newDesc,newData };
	RingNode* seeker = this->anker->getNext(); //ptr auf letztes Element

	if (seeker == nullptr) {
		anker = new_el;
		anker->setNext(anker); 
	}
	else if (ende <= 5) { //Ring mit unter 6 Knoten - ohne Ueberschreiben
									 // min. 1 mehr hinzufuegen

		int cntN_tmp = this->countNodes;

		while (cntN_tmp > 0) {

			seeker->setAge(cntN_tmp);
			cntN_tmp--;

			if (cntN_tmp == 0)
				break;

			seeker = seeker->getNext();
		}
		if (ende == 1) //
			anker->setAge(1);

		new_el->setNext(seeker->getNext());
		anker->setNext(new_el);
		anker = new_el;
		this->countNodes++;
	}
	else { //wenn Ring voll ist
		RingNode* ptr = anker->getNext();
		int newAge = 5; //neue Werte fuer Knoten

		do {
			ptr = ptr->getNext();
			ptr->setAge(newAge); 
			newAge--;

		} while (newAge != 0);

		//Umtausch und Loeschen des letzten Knotens
		new_el->setNext(anker->getNext()->getNext());
		delete anker->getNext();

		anker->setNext(new_el); //keine dangling ptr
		anker = new_el;
	}
}

bool Ring::search(std::string Data)
{
	RingNode* seeker = anker;
	int ende = this->countNodes;

	cout << "////Searching..." << endl << endl; //Sleep(1250);

	do {
		if (seeker->getData() == Data) {
			cout << "Data found in backup." << endl
				<< "Data No. " << seeker->getAge() << endl
				<< "Description: " << seeker->getDescription() << endl
				<< "Data: " << seeker->getData() << endl << endl;
			return true;
		}

		ende--;
		seeker = seeker->getNext();

	} while (ende > 0);

	cout << "No data backup with " << Data << " found." << endl << endl; return false;
}

void Ring::print()
{
	//RingNode* seeker = anker;
	//int cnt = 0, elements = this->countNodes;
	//
	//cout << "Data No. " << seeker->getAge()
	//	<< ", Description: " << seeker->getDescription()
	//	<< ", Data: " << seeker->getData() << endl;
	//cout << "--------------------------" << endl;
	//
	//while (seeker->getAge()) {
	//
	//
	//
	//	seeker = seeker->getNext();
	//	cnt++;
	//}

	if (this->countNodes == 0) {
		cout << "No data backups found." << endl << endl; return;
	}
	else if (this->countNodes == 1) {
		cout << "Data No. " << anker->getAge()
			<< ", Description: " << anker->getDescription()
			<< ", Data: " << anker->getData() << endl;
		cout << "--------------------------" << endl;
		return;
	}
	print(this->anker->getNext());
	 // Falsche Reihenfolge 054321
	// richtig ist 012345 - done
}

void Ring::print(RingNode* tmp)
{
	RingNode* ptr = tmp;
	if (ptr->getAge() != 0)
		print(tmp->getNext());

	cout << "Data No. " << tmp->getAge()
		<< ", Description: " << tmp->getDescription()
		<< ", Data: " << tmp->getData() << endl;
	cout << "--------------------------" << endl;
}
