#include "Helper.h"

int main()
{
	size_t pos = 0;
	string input = "";
	cout << "Bitte geben Sie die Zeichenkette ein: ";
	getline(cin, input);
	parse_gesamtausdruck(input, pos);
	if (pos != input.length())
		cout << "Error! Noch Input-Zeichen uebrig.\n";
	system("PAUSE");
	return 0;
}