#include <iostream>
using namespace std;

unsigned int my_strlen(const char* ptr)
{
	int i = 0;
	for (; i < 20; i++)
	{
		if (ptr[i] == '\0')
		{
			break;
		}
	}
	return i;
}

char* my_strconcat2(const char* sptr1, const char* sptr2, unsigned int count)
{
	int i = 0;

	/*int sptr1_len = my_strlen(sptr1);
	int sptr2_len = my_strlen(sptr2);*/

	const int output_len = count; //max laenge beim Aufruf definiert

	char* output;
	output = new char[output_len];
	for (; i < my_strlen(sptr1) && i < count; i++)
	{
		output[i] = sptr1[i];
	}
	for (int j = 0; j < my_strlen(sptr2) && i < count; i++, j++)
	{
		output[i] = sptr2[j];
	}
	output[i] = '\0';
	return output;
}

int main()
{
	const int len = 20;
	char array1[len] = { 0 };
	char array2[len] = { 0 };
	int anzahl;
	//char* my_strconcat(const char* ptr1, const char* ptr2);

	cout << "Bitte ersten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(array1, len);
	cout << "Bitte zweiten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(array2, len);
	cout << "Anzahl Zeichen: ? ";
	cin >> anzahl;
	char* ergebnis;
	ergebnis = my_strconcat2(array1, array2, anzahl);
	cout << "Ergebnis my_strconcat2(): " << ergebnis << endl;
	system("PAUSE");
	return 0;
}
