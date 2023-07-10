#include<iostream>
using namespace std;

int main()
{
	int array[9] = { 0 };
	for (int i = 0; i < 9; i++)
	{
		while (!(array[i] >= 1 && array[i] <= 6))
		{
			cout << "Bitte geben Sie die " << i + 1 << ". Zahl ein: ? ";
			cin >> array[i];
		}
	}

	int haeufigkeit[9] = { 0 };
	int input = 0, counter = 0, diffrence = 0;

	for (int i = 0; i < 6; i++)
	{
		counter = 0;
		for (int j = 0; j < 9; j++)
		{
			if (i + 1 == array[j])
			{
				counter++;
				haeufigkeit[i] = counter;
			}
		}
		
		if (haeufigkeit[i] > 0)
			diffrence++;
	}

	cout << "In der Eingabe kamen "<< diffrence <<" unterschiedliche Zahlen vor." << endl;

	system("PAUSE");
	return 0;
}