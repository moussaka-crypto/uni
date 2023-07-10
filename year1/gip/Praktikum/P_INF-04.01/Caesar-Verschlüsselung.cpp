#include <iostream>
#include <string>
using namespace std;

int main()
{
	string text;
	unsigned int v = 0; //Verschiebepositionen

	cout << "Bitte geben Sie den zu verschluesselnden Text ein: ";
	getline(cin, text);

	cout << "Bitte geben Sie die Anzahl Verschiebepositionen ein (als positive ganze Zahl): ";
	cin >> v;
	v = v % 26; //Wrap-Around mit % Operator!!
	

	for (unsigned int i = 0; i < text.length(); i++)
	{
		unsigned char pos = text.at(i);

		if (!('a' <= text.at(i) && text.at(i) <= 'z' || 'A' <= text.at(i) && text.at(i) <= 'Z'))
		{
			pos = text.at(i); //Sonderzeichen ausserhalb des Intervals
			cout << pos;
		}
		else if (text.at(i) >= 'a' && text.at(i) <= 'z') 
		{
			pos = text.at(i) + v;
			if ('z' < pos)
			{
				pos = ('a' - 1) + (pos - 'z');
			}
			cout << pos;
		}
		else if (text.at(i) >= 'A' && text.at(i) <= 'Z') 
		{
			pos = text.at(i) + v;
			if ('Z' < pos)
			{
				pos = ('A' - 1) + (pos - 'Z');
			}
			cout << pos;
		}		
	}
	cout << endl;

	system("PAUSE");
	return 0;
}