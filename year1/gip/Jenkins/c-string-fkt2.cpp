#include <iostream>
#include <string>
using namespace std;

int my_strcmp(const char* ptr1, const char* ptr2)
{
	for (int i = 0; i < 20; i++)
	{
		if (ptr1[i] != ptr2[i])
		{
			if (ptr1[i] < ptr2[i]) { return -1; }
			else { return 1; }
		}
	}
	return 0;
}

int main() {
	const int len1 = 20;
	const int len2 = 20;
	char arr1[len1] = { 0 };
	char arr2[len2] = { 0 };

	cout << "Bitte ersten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(arr1, len1);

	cout << "Bitte zweiten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(arr2, len2);

	int ergebnis = my_strcmp(arr1, arr2);

	if (ergebnis == 0) 
	{
		cout << "Die Texte sind identisch. Ergebnis my_strcmp(): " << ergebnis << endl;
	}
	else if (ergebnis == -1 || ergebnis == 1)
	{
		cout << "Ergebnis my_strcmp(): " << ergebnis << endl;
	}


	system("PAUSE");
	return 0;
}