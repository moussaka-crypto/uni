#include<iostream>
#include<string>
using namespace std;

int main()
{
	string eingabe;
	cout << "Bitte geben Sie die Zeichenkette (6 Zeichen!!!) ein: ? " ;
	cin >> eingabe;

	if (eingabe.at(0)==eingabe.at(5) && eingabe.at(1) == eingabe.at(4) && eingabe.at(2) == eingabe.at(3))
	{
		cout << "Das eingegebene Wort ist ein Palindrom." << endl;
	}
	else
	{
		cout << "Das eingegebene Wort ist KEIN Palindrom." << endl;
	}

	system("PAUSE");

	return 0;
}