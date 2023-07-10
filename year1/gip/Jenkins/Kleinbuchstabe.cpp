#include <iostream>
using namespace std;

int main() 
{
	char buchstabe;

	cout << "Bitte geben Sie das Zeichen ein: ? ";
	cin >> buchstabe;
	
	if (buchstabe >= 'a' && buchstabe <= 'z') 
	{
		cout << "Es wurde ein Kleinbuchstabe (a-z) eingegeben." << endl;
	}
	else 
	{
		cout << "KEIN Kleinbuchstabe (a-z)." << endl;
	}

	system("PAUSE");
	return 0;
}