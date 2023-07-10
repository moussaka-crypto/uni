#include<iostream>
#include<string>
using namespace std;

int main()
{
	string eingabe;
	cout << "Text: ? ";
	getline(cin, eingabe);

	for (int i =0 ; i<eingabe.length();i++)
	{
		while (!(eingabe.at(i) >= 'a' && eingabe.at(i) <= 'z'))
		{
			cout << "Text: ? ";
			getline(cin, eingabe);
		}
	}

	string ausgabe;
	for (int i = eingabe.length() - 1; i >= 0; i--)
	{
		ausgabe += eingabe.at(i);
	}

	if (eingabe == ausgabe) {
		cout << "Das eingegebene Wort ist ein Palindrom." << endl;
	}
	else {
		cout << "Das eingegebene Wort ist KEIN Palindrom." << endl;
	}

	system("PAUSE");
	return 0;
}