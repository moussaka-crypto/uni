#include<iostream>
#include <string>
using namespace std;

int main()
{
	string text, buchstabe ;
	cout << "Bitte Text eingeben (ggfs. mit Leerzeichen): ? " ;
	getline(cin, text);

	cout << "Bitte Buchstaben eingeben: ? ";
	getline(cin, buchstabe);

	int mal = 0;
	for (int i = 0; i <= text.length(); i++)
	{
		if (text[i] == buchstabe[0])
		{
			mal++;
		}
	}

	cout << "Der Buchstabe "<<buchstabe <<" kommt " << mal <<" mal im Text vor." << endl;

	system("PAUSE");
	return 0;
}