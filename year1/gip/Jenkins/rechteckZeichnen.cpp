#include<iostream>
using namespace std;

int main()
{
	int breite, hoehe;

	cout << "Bitte geben Sie die Breite des Rechtecks ein: ? ";
	cin >> breite;
	cout << "Bitte geben Sie die Hoehe des Rechtecks ein: ? ";
	cin >> hoehe;

	for (int rows = 0; rows < hoehe; rows++)
	{
		for (int cols = 0; cols < breite; cols++)
		{
			if (rows == 0 || rows == hoehe - 1 || cols == 0 || cols == breite - 1)
			{
				cout << "*";
			}
			else {
				cout << "+";
			}

		}
		cout << endl;
	}

	system("PAUSE");
	return 0;
}