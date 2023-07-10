#include<iostream>
#include<string>
using namespace std;

int main()
{
	string zeilen[5] = { "" };
	int counter = 0;
	char vorher = ' ';
	int erste_zahl_vorhanden = 0;
	//Wertzuweisungen durch For-Schleife - Abfrage von Maximal 4 Werten
	for (int i = 0; i < 5; i++) {
		cout << "Eingabezeile = ? ";
		getline(cin, zeilen[i]);
		//Wenn die Eingabe leer ist, so wird die Schleife beendet und keine weitere Abfrage findet statt
		if (zeilen[i] == "") break;
		else { counter++; }
	}
	for (int i = 0; i < counter; i++) {
		erste_zahl_vorhanden = 0;
		for (int x = 0; x < zeilen[i].length(); x++) {
			if (zeilen[i].length() == 0 && zeilen[i].at(x) == ' ') {
				continue;
			}
			else if (zeilen[i].at(x) == ' ' && vorher != ' ' && erste_zahl_vorhanden == 1) {
				cout << endl;
			}
			else if (isalpha(zeilen[i].at(x)))
			{
				cout << zeilen[i].at(x);
				erste_zahl_vorhanden = 1;
			}
			vorher = zeilen[i].at(x);
		}
		cout << endl;
	}

	system("pause");
	return 0;
}

