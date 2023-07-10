#include<iostream>
using namespace std;

int main()
{
	int zahl1, zahl2, zahl3, zahl4;
	int gleich = 0;
	int ungleich = 0;
	cout << "Bitte geben Sie die 1. Zahl ein: ? ";
	cin >> zahl1;
	cout << "Bitte geben Sie die 2. Zahl ein: ? ";
	cin >> zahl2;
	cout << "Bitte geben Sie die 3. Zahl ein: ? ";
	cin >> zahl3;
	cout << "Bitte geben Sie die 4. Zahl ein: ? ";
	cin >> zahl4;

	if (zahl1 == 99) {
		gleich ++;
	}
	else {
		ungleich++;
	}
	if (zahl2 == 99) {
		gleich++;
	}
	else {
		ungleich++;
	}
	if (zahl3 == 99) {
		gleich++;
	}
	else {
		ungleich++;
	}
	if (zahl4 == 99) {
		gleich++;
	}
	else {
		ungleich++;
	}

	cout << gleich << " Eingabezahlen waren gleich der Vergleichszahl 99." << endl;
	cout << ungleich << " Eingabezahlen waren ungleich der Vergleichszahl 99." << endl;
	
	system("PAUSE");

	return 0;
}