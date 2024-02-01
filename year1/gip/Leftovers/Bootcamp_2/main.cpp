#include <iostream>
using namespace std;
#include "math.h"

int main()
{
	int operation, z1, z2;
	cout << "1: Addition\n" << "2: Subtraktion\n" << "3: Multiplikation\n" << "4: Fakultaet\n";
	do {
		cout << "Bitte waehlen Sie eine Operation aus: ";
		cin >> operation;
	} while (operation < 1 || operation > 4);
	if (operation != 4)
	{
		cout << "Bitte geben Sie die erste Zahl ein: ";
		cin >> z1;
		cout << "Bitte geben Sie die zweite Zahl ein: ";
		cin >> z2;
	}
	else { // f�r die Fakult�t nur ein Parameter notwendig
		cout << "Bitte geben Sie die Zahl ein, fuer welche die Fakultaet berechnet werden soll: ";
		cin >> z1;
	}
	int ergebnis;
	switch (operation)
	{
	case 1:
		ergebnis = addiere(z1, z2);
		break;
	case 2:
		ergebnis = subtrahiere(z1, z2);
		break;
	case 3:
		ergebnis = multipliziere(z1, z2);
		break;
	case 4:
		ergebnis = fakultaet(z1);
		break; // unnoetig
	}
	cout << "Ergebnis: " << ergebnis << '\n';

	int zahl_aktion, zahl1, zahl2;
	cout << "\n1: Addition\n";
	cout << "2: Subtraktion\n";
	cout << "3: Multiplikation\n";
	cout << "4: Fakultaet\n";
	cout << "\nBitte waehlen Sie eine Operation aus: ";
	cin >> zahl_aktion;
	if (zahl_aktion < 1 || zahl_aktion > 4) {
		cout << "Fehlerhafte Eingabe!";
		return 0; // beendet Programm
	}
	else {
		if (zahl_aktion != 4) {
			cout << "Bitte geben Sie die erste Zahl ein: ";
			cin >> zahl1;
			cout << "Bitte geben Sie die zweite Zahl ein: ";
			cin >> zahl2;
		}
		else { // f�r die Fakult�t ist nur ein Parameter notwendig
			cout << "Bitte geben Sie die Zahl ein, fuer welche die Fakultaet berechnet werden soll: ";
			cin >> zahl1;
		}
		int ergebnis;
		switch (zahl_aktion) {
		case 1:
			ergebnis = addiere(zahl1, zahl2);
			break;
		case 2:
			ergebnis = subtrahiere(zahl1, zahl2);
			break;
		case 3:
			ergebnis = multipliziere(zahl1, zahl2);
			break;
		case 4:
			ergebnis = fakultaet(zahl1);
		}
		cout << "Ergebnis: " << ergebnis << '\n';
		return 0;
	}
}
