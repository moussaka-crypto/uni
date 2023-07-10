#include<iostream>
#include<string>
using namespace std;

int main() {

	string text = "";
	char x = ' ';
	cout << "Bitte Text eingeben (ggfs. mit Leerzeichen): ? "; getline(cin, text);

	string final = "";
	for (int i = 0; i < text.length(); i++)
	{
		// fuer die Leerzeichen
		if (text.at(i) == ' ')
		{
			final += '_';
		}
		// aus jede Grossbuchstabe 3 Exemplare machen
		if (text.at(i) >= 'A' && text.at(i) <= 'Z')
		{
			for (int k = 0; k < 3; k++)
			{
				final += text.at(i);
			}
		}
		// aus jeder Kleinbuchstabe 2 Exemplare machen
		if (text.at(i) >= 'a' && text.at(i) <= 'z')
		{
			for (int k = 0; k < 2; k++)
			{
				final += text.at(i);
			}
		}
		//fuer die Ziffern
		if (text.at(i) >= '0' && text.at(i) <= '9')
		{
			final += '.';
		}
		//fuer Sondernzeichen
		if (text.at(i) == '?' || text.at(i) == '!')
		{
			final = final;
		}
		//Alles andere, wird ubernommen wie vorher
		if (!(text.at(i) == ' ')&& !(text.at(i) >= 'a' && text.at(i) <= 'z')&& !(text.at(i) >= 'A' && text.at(i) <= 'Z')&&
			!(text.at(i) >= '0' && text.at(i) <= '9')&& !(text.at(i) == '?' || text.at(i) == '!'))
		{
			final += text.at(i);
		}
	}
	cout << "Der Text nach der Umwandlung: " << final << endl;

	system("PAUSE");
	return 0;
}