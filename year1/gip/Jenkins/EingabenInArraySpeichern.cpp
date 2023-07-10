#include<iostream>
using namespace std;

int main()
{
	int array[9] = { };
	for (int i = 0; i < 9; i++)
	{
		while (!(array[i] >= 1 && array[i] <= 6))
		{
			cout << "Bitte geben Sie die " << i + 1 << ". Zahl ein: ? ";
			cin >> array[i];
		}
	}
	for (int i = 0; i < 9; i++)
	{
		cout << "Die " << i + 1 << ". eingegebene Zahl lautete: " << array[i] << endl;
	}

	int h[6] = {0};

	for (int i = 0; i < 9; i++)
	{
		for (int count = 0; count < 6; count++)
		{
			if (array[i]== count +1)
			{
				h[count]++;
			}
		}
	}

	for (int count = 0; count < 6; count++)
	{
		cout << "Die Zahl " << count + 1 << " wurde " << h[count] << " mal eingegeben." << endl;
	}


	system("PAUSE");
	return 0;
}