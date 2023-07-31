#include <iostream>
using namespace std;

int main()
{
	unsigned int jahreszahl; // unsigned fuer positive Werte ab 0 
	cout << "Bitte geben Sie die Jahreszahl ein: "; cin >> jahreszahl;

	if (jahreszahl % 400 == 0 || jahreszahl % 4 == 0 && jahreszahl % 100 != 0) // alle Bedingungen in einem if-Zweig 
		cout << jahreszahl << " ist ein Schaltjahr." << endl;

	else
		cout << jahreszahl << " ist kein Schaltjahr." << endl;

	system("PAUSE");
	return 0;
}