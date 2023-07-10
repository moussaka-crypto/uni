#include<iostream>
#include <string>
using namespace std;

int main() {
	string eingabe = "";
	char stelle = ' ';
	int zahl = 0;
	cout << "Bitte die Zahl oder das Wort 'ende' eingeben: ? "; cin >> eingabe;

	if (eingabe != "ende") {
		zahl = stoi(eingabe);
		zahl = zahl * 2;
		cout << "Der doppelte Wert betraegt: " << zahl << endl;
	}
	else {
		cout << "Das Programm beendet sich jetzt." << endl;
	}
}