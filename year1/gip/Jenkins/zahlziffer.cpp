#include<iostream>
using namespace std;

int main()
{
	char eingabe;
	cout << "Bitte geben Sie das Zeichen ein: ? ";
	cin >> eingabe;

	if (eingabe == 'e') {
		cout << "Das Programm beendet sich jetzt." << endl;
	}
	else if (eingabe >= '0' && eingabe <= '9') {
		int zahl = int(eingabe) - 48;
		cout << eingabe << " + 5 = " << zahl + 5 << endl;
	}
	else {
		cout << "Weder 'e' noch Ziffer" << endl;
	}

	system("PAUSE");
	return 0;
}