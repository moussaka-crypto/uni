#include <iostream>
using namespace std;

int main() {

	int zahl1, zahl2, zahl3 ;
	int klein, gross;
	

	cout << "Bitte geben Sie die 1. Zahl ein: ? ";
	cin >> zahl1;
	cout << "Bitte geben Sie die 2. Zahl ein: ? ";
	cin >> zahl2;
	if (zahl1 > zahl2) {
		gross = zahl1;
		klein = zahl2;
	}
	else {
		gross = zahl2;
		klein = zahl1;
	}
	cout << "Bitte geben Sie die 3. Zahl ein: ? ";
	cin >> zahl3;
	if (zahl3 > gross) {
		gross = zahl3;
	}
	else if (zahl3 < klein) {
		klein = zahl3;
	}
	
	cout << "Die kleinste eingegebene Zahl lautet: " << klein << endl;
	cout << "Die groesste eingegebene Zahl lautet: " << gross << endl;

	system("PAUSE");
	return 0;
}