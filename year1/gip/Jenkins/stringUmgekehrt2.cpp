#include<iostream>
#include<string>
using namespace std;

int main()
{
	string eingabe;
	cout << "Bitte Text eingeben (ggfs. mit Leerzeichen): ? ";
	getline(cin, eingabe);
	// getline damit es auch die Leerzeichen lesen und mitnehmen kann
	cout << "Eingabetext: " << eingabe << endl;

	string ausgabe;
	for (int i = eingabe.length() - 1; i >= 0; i--)
	{
		ausgabe += eingabe.at(i);
	}
	cout << "Ergebnis: " << ausgabe << endl;

	system("PAUSE");
	return 0;
}