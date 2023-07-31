#include <iostream>
#include "rechteck.h"
using namespace std;

int main()
{
	unsigned int L1, L2, W1, W2;
	cout << "\nBitte geben Sie die Laenge des 1. Rechtecks ein: \n"; cin >> L1;
	cout << "Bitte geben Sie die Breite des 1. Rechtecks ein: \n"; cin >> W1;
	cout << "Bitte geben Sie die Laenge des 2. Rechtecks ein: \n"; cin >> L2;
	cout << "Bitte geben Sie die Breite des 2. Rechtecks ein: \n"; cin >> W2;

	Rechteck r1{ L1, W1 };
	Rechteck r2{ L2, W2 };
	bool gleich = vergleiche_flaechen(r1, r2);

	if (gleich) {
		cout << "Der Flaeheninhalt beider Rechtecke ist gleich.\n";
	}
	else {
		cout << "Der Flaecheninhalt beider Rechtecke ist nicht gleich.\n";
	}

	system("pause");
	return 0;
}