#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
	int st, min, takt;
	do {
		cout << "Bitte geben Sie die Stunden der Startuhrzeit ein: ";
		cin >> st;
	} while (st > 23 || st < 0);

	do {
		cout << "Bitte geben Sie die Minuten der Startuhrzeit ein: ";
		cin >> min;
	} while (min >= 60 || min < 0);

	cout << setfill('0'); //neue manipulatoren benutzt
	cout << "Der erste Bus faehrt also um " << setw(2) << st << ":" << setw(2) <<  min << " Uhr." << endl;

	do {
		cout << "Bitte geben Sie die Taktzeit in Minuten ein: ";
		cin >> takt;
	} while (takt > 180 || takt <= 0);

	//Bedingungen für Fahrplan von hier an
	cout << endl;
	cout << "Busfahrplan heute: " << endl; 
	cout << endl;

	while (st<=23 && min<=59)
	{
		cout << setfill('0'); // neue manipulatoren benutzt
		cout << setw(2) << st << ":" << setw(2) << min << " ";

		min += takt;

		if (min > 59 && min < 120)
		{
			st += (min / 60);
			min -= 60;
			cout << endl;
		}
		else if (min >= 120)
		{
			st += (min / 60);
			min -= 120;
			if (min > 59) min -= 60;
			cout << endl;
		}
	}
	cout << endl;
	system("PAUSE");
	return 0;
}
