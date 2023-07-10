#include "hashtable.h"
#include <iostream>

using namespace std;

int get_next_prime(int x) //vorgegeben
{
	x++;
	bool found = true;
	while (true)
	{
		found = true;
		for (int i = 2; i <= sqrt(x); i++)
		{
			if (x % i == 0)
			{
				found = false;
				break;
			}
		}
		if (found)
		{
			return x;
		}
		x += 1;
	}
}

bool isPrime(int n) // check if num is prime - rehashing
{
	// Corner case
	if (n <= 1)
		return false;

	// Check from 2 to n-1
	for (int i = 2; i < n; i++)
		if (n % i == 0)
			return false;

	return true;
}

// Berechnung des Hashwertes mit quadr. Sondieren
int HashTable::hashValue(int item)
{
	int st = this->st,  
		x = item, 
		M = getSize(),
		i = 0;

	if (st == 0) // Lineares Sondieren
	{
		while (hashTable->at(((x + i) % M)) != -1)
		{
			i++;
			collisionCount++;
		}
		return ((x + i) % M);
	}
	else if (st == 1) // Quadratisches Sondieren (standardmäßig)
	{
		while (hashTable->at((x + i * i) % M) != -1)
		{
			i++;
			collisionCount++;
		}
		return ((x + i * i) % M);
	}
	else // Doppeltes Hashing
	{
		int R = get_next_prime(M);
		for (int j = 0; j < M; j++)
		{
			if (get_next_prime(R) > M)
				break;
			R = get_next_prime(R);
		}
		//R ist nun die naecsht kleinere Primazahl zu M (R < M)

		while (hashTable->at((x + i * (R - x % R)) % M) != -1)
		{
			i++;
			collisionCount++;
		}
		return ((x + i * (R - x % R)) % M);
	}
}


void HashTable::rehashing()
{
	double avg_size = this->elements / (double)this->size;

	if (avg_size < this->threshold_rehashing)
		return;
	else
	{
		int newSize = 0;
		const int testSize = (2 * getSize()) + 1;

		if (!isPrime(testSize))
			newSize = get_next_prime((2 * getSize()));
		else
			newSize = testSize;

		if (newSize > get_next_prime(1000)) //997
			return;
		else
		{
			int hashIdx = 0, item = 0;
			HashTable* H = new HashTable(newSize);

			for (int i = 0; i < this->getSize(); i++)
			{
				if (hashTable->at(i) != -1)
				{
					item = this->hashTable->at(i);
					hashIdx = H->hashValue(item);
					H->hashTable->at(hashIdx) = item;
					H->elements++;
				}
				else 
					continue;
			}
			this->~HashTable();

			this->hashTable = H->hashTable;
			this->size = H->size;
			this->elements = H->elements;
			this->collisionCount = H->collisionCount;
		}
	}
}

int HashTable::insert(int item)
{
	int hashWert = hashValue(item); // check if full, implemented in Rehashing 
	hashTable->at(hashWert) = item;
	elements++;
	this->rehashing();

	cout << "Hash Index: " << hashWert << endl;
	cout << "Size: " << size << endl << endl;

	return 0;
}

void HashTable::print() 
{
	cout << "--------------Hash_Table--------------" << endl;
	for (int i = 0; i < hashTable->size(); i++)
	{
		cout << "[" << i << "] -> " << hashTable->at(i) << endl;
	}
	cout << "--------------------------------------" << endl;
}
