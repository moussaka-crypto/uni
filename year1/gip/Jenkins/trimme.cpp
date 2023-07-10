#include<iostream>
#include <string>
using namespace std;

string trimme(string s)
{
	string temp;
	string temp2;
	string temp3;
	int c = 0;
	int p = 0;

	for (int i = 0; i < s.length(); i++) // die ersten + wegraeumen
	{
		if (c < 1) {
			if (s.at(i) >= 'a' && s.at(i) <= 'z') {
				c++;
			}
		}
		if (c == 1) {
			temp += s.at(i);
		}
	}

	for (int k = temp.length() - 1; k >= 0; k--) //umgekehrt ausgeben, die ohne + am ende 
	{
		if (p < 1) {
			if (temp.at(k) >= 'a' && temp.at(k) <= 'z') {
				p++;
			}
		}
		if (p == 1) {
			temp2 += temp.at(k);
		}
	}
	for (int i = temp2.length() - 1; i >= 0; i--)  
	{
		temp3 += temp2.at(i);
	}

	return temp3;
}


int main()
{
	string s = "";

	cout << "Bitte geben Sie die Textzeile ein: ? ";
	getline(cin, s);

	cout << "Vorher: " << s << endl;
	cout << "Nachher: " << trimme(s) << endl;

	system("PAUSE");
	return 0;
}