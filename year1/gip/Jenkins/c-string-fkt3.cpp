#include <iostream>
#include <string>
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

char* my_strconcat(const char* ptr1, const char* ptr2)
{
	int i = 0; // i global definiert, denn in beiden Schleifen benutzt
	
	//Längen der beiden C-Strings nehmen
	int str_len1 = my_strlen(ptr1);
	int str_len2 = my_strlen(ptr2);
	const int output_len = str_len1 + str_len2; //max Laenge des neuen C-Strings

	char* output;
	output = new char[output_len]; //Platz auf dem Heap allozieren - max 40 Zeichen
	for (; i < str_len1; i++)
	{
		output[i] = ptr1[i]; //ersten C-String platzieren
	}
	for (int j = 0; j < str_len2; j++, i++)
	{
		output[i] = ptr2[j];
	}
	output[i] = '\0';
	return output;
}

int main() {
	const int len1 = 20;
	const int len2 = 20;
	char arr1[len1] = { 0 };
	char arr2[len2] = { 0 };
	char erg[len1 + len2] = { 0 };

	cout << "Bitte ersten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(arr1, len1);

	cout << "Bitte zweiten Text eingeben (ggfs. mit Leerzeichen): ? ";
	cin.getline(arr2, len2);
	char* ergebnis;
	ergebnis = my_strconcat(arr1, arr2);
	cout << "Ergebnis my_strconcat(): " << ergebnis << endl;

	system("PAUSE");
	return 0;

}