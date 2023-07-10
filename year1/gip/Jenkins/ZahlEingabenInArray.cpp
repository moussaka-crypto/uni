#include<iostream>
using namespace std;

int main()
{
	int array[9] = { };

	for (int i = 0; i < 9; i++)
	{
		while (!(array[i] >= 1 && array[i] <= 6 ))
		{ 
			cout << "Bitte geben Sie die "<< i+ 1 <<". Zahl ein: ? ";
			cin >> array[i];
		}
	}

	for (int i = 0; i < 9; i++)
	{
		cout << "Die "<<i+1<<". eingegebene Zahl lautete: "<<array[i] ;
		cout << endl;

	}

	system("PAUSE");
	return 0;
}