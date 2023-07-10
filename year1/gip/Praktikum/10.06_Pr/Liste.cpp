#include <iostream>
using namespace std;

struct TListenKnoten {

	int data;
	TListenKnoten* next;
	TListenKnoten* first;
};

void vorne_anfuegen(TListenKnoten*& anker, int wert)
{
	TListenKnoten* node = new TListenKnoten{ wert, nullptr, nullptr };
	node->next = anker;
	node->first = node;
	anker = node;

	TListenKnoten* ptr = anker;
	while(ptr->next!=nullptr)
	{
		ptr = ptr->next;
		ptr->first = node;
	}
}

void liste_ausgeben(TListenKnoten*& anker, int wert)
{
	if (anker == nullptr)
		cout << "/////Leere Liste./////" << endl;

	else
	{ // Liste nicht leer
		cout << "[ ";

		TListenKnoten* ptr = anker; // Initialisieren des Arbeitspointers ( merkt, wo wir uns in der Liste befinden )

		do // traversieren durch Schleife
		{
			cout << ptr->data; // aktueller Knoten ausgeben

			if (ptr->next != nullptr) // d.h. es gibt einen Nachfolger in der Liste
				cout << " , ";

			else cout << " "; // nix

			ptr = ptr->next; // Pfeil auf naechstes Element ( Pfeil wird kopiert )

		} while (ptr != nullptr); // Schleife wiederholt sich, bis das Ende der Liste erreicht ist

		cout << "]" << endl;
	}
}

int main() {
	
	TListenKnoten* anker = nullptr;
	int wert;
	do{
		cout << "Wert eingeben: ";
		cin >> wert;
		vorne_anfuegen(anker, wert);
	} while (wert >= 0 && wert <= 99);
	

	
	liste_ausgeben(anker, wert);

		
}