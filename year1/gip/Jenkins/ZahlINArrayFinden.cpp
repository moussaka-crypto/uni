#include<iostream>
using namespace std;

int main()
{
	int array[6] = { };
	for (int i = 0; i < 6; i++)
	{
		while (!(array[i] >= 1 && array[i] <= 6))
		{
			cout << "Bitte geben Sie die " << i + 1 << ". Zahl ein: ? ";
			cin >> array[i];
		}
	}

	int suchzahl;
	cout << "Bitte geben Sie die Suchzahl ein: ? ";
	cin >> suchzahl;

	int counter = 0;
	for (int i =0 ; i < 6; i++)
	{
		counter++;
		if (suchzahl == counter)
		{
		cout << "Die Suchzahl kam unter den Eingaben vor." << endl;
		break;
		}
		if (counter == 6)
		{
			cout << "Die Suchzahl kam NICHT unter den Eingaben vor." << endl;
		}
	}

	system("PAUSE");
	return 0;
}