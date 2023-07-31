#include <iostream>
using namespace std;

int main()
{
	const int arr_length = 7;
	int array[] = { 3,8,2,10,1,12,8 };

	//Wiederholen, so oft wie Arrayelemente 
	for (int anzahl = 0; anzahl <= arr_length; anzahl++)
	{
		//Aufsteigephase:
		//	Von links nach rechts durchlaufen

		for (int index = 0; index <= arr_length - 2; index++)
		{
			//Nachbarn vergleichen
			if (array[index] > array[index + 1])
			{
				// ggfs tauschen
				int tmp = array[index];
				array[index] = array[index + 1];
				array[index + 1] = tmp;
			}
		}
	}

	for (int i = 0; i < arr_length; i++)
		cout << array[i] << endl;

	system("PAUSE");
	return 0;
}