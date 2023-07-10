#include <iostream>
#include <string>
using namespace std;

const int sudoku_groesse = 9;
const int eingabe_groesse = 11;

bool pruefe_spalten(int sudoku[][sudoku_groesse])
{
	int vorkommen;
	bool flag = true; // fuer die zweite bzw. dritte sudoku

	for (int i = 0; i < 9; i++) {
		// fuer die Spalten

		for (int k = 1; k < 10; k++) {
			// wie oft es kommt

			vorkommen = 0;
			for (int j = 0; j < 9; j++) {

				if (sudoku[j][i] == k) {
					vorkommen++;
				}
			}

			if (vorkommen > 1) {

				flag = false;
				cout << "Spalte " << i << ": Zahl " << k << " kommt mehrfach vor." << endl;
			}
			else if (vorkommen == 0) {

				flag = false;
				cout << "Spalte " << i << ": Zahl " << k << " kommt nicht vor." << endl;
			}
		}
	}
	return flag;
}
bool pruefe_zeilen(int sudoku[][sudoku_groesse])
{
	int vorkommen;
	bool flag = true; // fuer die zweite bzw. dritte sudoku

	for (int i = 0; i < 9; i++) {
		// fuer die Zeilen

		for (int k = 1; k < 10; k++) {

			vorkommen = 0;
			for (int j = 0; j < 9; j++) {

				if (sudoku[i][j] == k) {
					vorkommen++;
				}
			}

			if (vorkommen > 1) {

				flag = false;
				cout << "Zeile " << i << " Zahl " << k << " kommt mehrfach vor." << endl;
			}

			else if (vorkommen == 0) {

				flag = false;
				cout << "Zeile " << i << " Zahl " << k << " kommt nicht vor." << endl;
			}
		}
	}
	return flag;
}
bool pruefe_bloecke(int sudoku[][sudoku_groesse])
{
	int vorkommen;
	bool flag = true; // fuer die zweite bzw. dritte sudoku

	for (int block = 0; block < 9; block++) {

		for (int k = 1; k < 10; k++) {

			vorkommen = 0;
			for (int j = ((block / 3) * 3); j < ((block / 3) * 3) + 3; j++) {

				for (int z = ((block % 3) * 3); z < ((block % 3) * 3) + 3; z++)

					if (sudoku[j][z] == k) {

						vorkommen++;
					}
			}

			if (vorkommen > 1) {

				flag = false;
				cout << "Block " << block << " Zahl " << k << " kommt mehrfach vor." << endl;
			}

			else if (vorkommen == 0) {

				flag = false;
				cout << "Block " << block << " Zahl " << k << " kommt nicht vor." << endl;

			}
		}
	}
	return flag;
}

void konvertiere(string eingabe[], int sudoku[][sudoku_groesse])
{ 
	int zeile = 0;
	int spalte = 0;

	for (int i = 0; i < 11; i++) {

		spalte = 0;
		if (i == 3 || i == 7) {
			// keine Zahlen
			continue;
		}

		for (int j = 0; j < 22; j++) {

			if (eingabe[i][j] != '.' && eingabe[i][j] != '|') {

				sudoku[zeile][spalte] = int(eingabe[i][j] - 48); //zuerst wird die zeile mit i, dann die spalte mit j
				spalte++;
			}
		}
		zeile++;
	}
}

int main()
{
	int sudoku[sudoku_groesse][sudoku_groesse] = { 0 };
	string eingabe[eingabe_groesse];

	cout << "Bitte geben Sie das Sudoku ein:" << endl;

	for (int i = 0; i < eingabe_groesse; i++)
		getline(cin, eingabe[i]);

	konvertiere(eingabe, sudoku);

	bool ps = pruefe_spalten(sudoku);
	bool pz = pruefe_zeilen(sudoku);
	bool pb = pruefe_bloecke(sudoku);

	if (ps && pz && pb) cout << "Das Sudoku ist gueltig." << endl;

	system("PAUSE");
	return 0;
}