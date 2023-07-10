#include <iostream>
using namespace std;

int main()
{
	int array[5] = { 0 };
	for (int i = 0; i < 5; i++)
	{
		cout << "Bitte geben Sie die " << i + 1 << ". Zahl ein: ? ";
		cin >> array[i];
	}	
	for (int i = 0; i < 5; i++)
	{
		cout << "Die " << i + 1 << ". eingegebene Zahl lautete: " << array[i] << endl;
	}
	
	int min = array[0];
	int max = array[0];

	for (int i = 0; i < 5; i++)
	{
		if (min > array[i])
		{
			min = array[i];
		}
		else if (max < array[i])
		{
			max = array[i];
		}
	}

	cout << "Die kleinste eingegebene Zahl lautete: " << min << endl;
	cout << "Die groesste eingegebene Zahl lautete: " << max << endl;

	system("PAUSE");
	return 0;
}