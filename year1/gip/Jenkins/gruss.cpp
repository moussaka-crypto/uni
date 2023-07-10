#include<iostream>
using namespace std;

int main()
{
	int eingabe;
	cout << "Bitte geben Sie die Stunde der aktuellen Uhrzeit ein: ? " ;
	cin >> eingabe;

	if (eingabe == 23 || eingabe == 0 || eingabe == 1 || eingabe == 2 || eingabe == 3 || eingabe == 4 || eingabe == 5 )
	{
		cout << "Gute Nacht." << endl;
	}
	else if (eingabe == 6 || eingabe == 7 || eingabe == 8 || eingabe == 9 || eingabe == 10)
	{
		cout << "Guten Morgen." << endl;
	}
	else if (eingabe == 11 || eingabe == 12 || eingabe == 13 )
	{
		cout << "Mahlzeit" << endl;
	}
	else if (eingabe == 14 || eingabe == 15 || eingabe == 16 || eingabe == 17)
	{
		cout << "Guten Tag." << endl;
	}
	else if (eingabe == 18 || eingabe == 19 || eingabe == 20 || eingabe == 21 || eingabe == 22)
	{
		cout << "Guten Tag." << endl;
	}
	else
	{
		cout << "Keine erlaubte Stundenangabe." << endl;
	}


	system("PAUSE");

	return 0;
}