#include<iostream>
using namespace std;

int main()
{
	int array[4] = { };
	for (int i = 0; i < 4; i++)
	{
		
			cout << "Bitte geben Sie die " << i + 1 << ". Zahl ein: ? ";
			cin >> array[i];
	
	}
	int vergleichZahl;
	cout << "Bitte geben Sie die Vergleichszahl ein: ? " ;
	cin >> vergleichZahl;

	int y = 0;
	int n = 0;
	for (int i = 0; i < 4; i++)
	{
	
		if (vergleichZahl == array[i])
		{
			y++;
		}
		else
		{
			n++;
		}
	}
	cout << y << " Eingabezahlen waren gleich der Vergleichszahl." << endl;
	cout << n << " Eingabezahlen waren ungleich der Vergleichszahl." << endl;

	system("PAUSE");
	return 0;
}