#include <iostream>
using namespace std;

int main()
{
	char buchstabe;
	
	cout << "Bitte geben Sie das Zeichen ein: ? ";
	cin >> buchstabe;

	if (buchstabe == 'J' || buchstabe == 'j') 
	{
		cout << "Es handelt sich um eine Ja Eingabe." << endl;
	}
	else if (buchstabe=='N'|| buchstabe=='n')
	{
		cout << "Es handelt sich um eine Nein Eingabe." << endl;
	}
	else
	{
		cout << "Es handelt sich um eine sonstige Eingabe." << endl;
	}
	
	system("PAUSE");
	return 0;
}