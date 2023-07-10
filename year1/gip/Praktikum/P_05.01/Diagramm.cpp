#include <iostream>
using namespace std;

int main()
{	
	int arr[5] = { 0 };
	for (int i = 0; i < 5; i++)
	{
		do
		{
			cout << "Bitte geben Sie die " << i+1 << ". Zahl ein : ? ";
			cin >> arr[i];

		} while (arr[i] < 1 || arr[i] > 9);
	} cout << endl;
	//Werte einlesen |||||||||||||||||||||||||||||||||

	for (int hl = 10; hl > 1; hl--) 
	{
		int hl_pos = hl - 1; //Zahl auf der Reihe, mit der verglichen wird, ob ./*/+
		cout << hl_pos;

		for (int i = 0; i < 5; i++)
		{
			if (arr[i] < hl_pos)
			{
				cout << ".";
			}
			else if (arr[i] == hl_pos)
			{
				cout << "*";
			}
			else cout << "+";
		}
		cout << endl;
	}
	cout << " 12345";
	cout << endl;

	system("PAUSE");
	return 0;
}