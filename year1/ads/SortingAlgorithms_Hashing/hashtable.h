#ifndef _HASHTABLE_H_
#define _HASHTABLE_H_

#include <vector>

using std::vector;

class HashTable {
private:
	int st = 1;						//Hashing Strategie - Default: Quadr.
	int size;						// Größe der HashTable
	int elements;					// Anz. d. Elemente in HashTable
	int collisionCount;				// Anz. d. Kollisionen beim Einfügen
	double threshold_rehashing;			// Schwellwert fürs rehashing (size/elements)
	vector<int>* hashTable;				// HashTable
	int hashValue(int item);			// calculate hash value
	void rehashing();					// rehashing

public:
	HashTable(int s, double threshold = 0.6) : size{ s }, elements{ 0 }, collisionCount{ 0 }, 
											   st{1}, threshold_rehashing{threshold}
	{
		hashTable = new vector<int>;
		hashTable->resize(s, -1);
	}
	~HashTable() { delete hashTable; }
	int at(int i) { return hashTable->at(i); }	// Liefert das i-te Element der Hashtabelle zurück
	int getCollisionCount() { return this->collisionCount; } // Liefert die Anzahl der Kollisionen zurück
	int getSize() { return this->size; } // Liefert die Größe der Hashtabelle zurück
	int getElements() { return this->elements; }// Liefert die Anzahl der Elemente der Hashtabelle zurück
	int insert(int);			// fügt ein Element der Hashtabelle hinzu
	void print();					// Ausgabe der Hashtable ind er Form: [0] -> 1

	void setStrategy(int str) { this->st = str; }

};

// Helper Funktion:
int get_next_prime(int);				// Gibt zu einer natuerlichen Zahl a, die nächstgrößere Primzahl zurück

#endif 