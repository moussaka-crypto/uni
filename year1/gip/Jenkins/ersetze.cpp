#include<iostream>
#include<string>
using namespace std;

string ersetze(string zeile, char zuerstezen,
	string ersatztext)
{
	string output = "";
	for (int i = 0; i < zeile.length(); i++)
	{
		if (zeile.at(i) == zuerstezen)
		{
			output += ersatztext;
		}
		else {
			output += zeile.at(i);
		}
	}
	return output;
}

int main()
{
	string s1 = ""; //zeile
	string s2 = ""; //ersatztext
	char c; //zu_ersetzendes_zeichen

	cout << "Bitte geben Sie die Textzeile ein: ? ";
	getline(cin, s1);
	
	cout << "Bitte geben Sie das zu ersetzende Zeichen ein: ? ";
	cin >> c;
	cin.ignore();
	
	cout << "Bitte geben Sie den einzusetzenden Text ein: ? ";
	getline(cin, s2);

	cout << "Ergebnis: " << ersetze(s1, c, s2) << endl;

	system("PAUSE");
	return 0;
}