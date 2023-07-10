#include<iostream>
#include<string>
using namespace std;

int main() {

	string text;
	cout << "Bitte Text eingeben (ggfs. mit Leerzeichen): ? ";
	getline(cin, text);

	char buchstabe;
	cout << "Bitte den zu ersetzenden Buchstaben eingeben: ? ";
	cin >> buchstabe;

	char ersatz_buchstabe;
	cout << "Bitte den Ersatz-Buchstaben eingeben: ? ";
	cin >> ersatz_buchstabe;

	int position = 0;
	for (; position < text.length(); position++)
	{
		if (text.at(position)==buchstabe)
		{
			text.at(position) = ersatz_buchstabe;
		}
	}

	cout << "Der Text nach der Ersetzung: " <<text << endl;


	system("PAUSE");
	return 0;
}