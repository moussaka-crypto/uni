#include<iostream>
using namespace std;

int main()
{
	char eingabe = '\0';
	cout << "Bitte geben Sie den Kleinbuchstaben ein: ? ";
	cin >> eingabe;
	int ausgabe = int(eingabe) - 32 ;
	char ausgabee = char(ausgabe);
	cout << "Der entsprechende Grossbuchstabe lautet: " << ausgabee << endl;


	system("PAUSE");
	return 0;
}