#include<iostream>
#include<string>
using namespace std;

void spalte_ab_erstem(char zeichen, string eingabe,
	string& erster_teil, string& zweiter_teil)
{
	int vermeid_pos = 0;
	bool in_text = false;

	for (int pos = 0; pos < eingabe.length(); pos++)
	{
		if (zeichen == eingabe.at(pos))
		{
			in_text = true;
			vermeid_pos = pos;
			break;
		}
		//else in_text = false;
	}

	if (in_text == false)
		erster_teil = eingabe;

	if (in_text == true)
	{
		for (int pos = 0; pos < vermeid_pos; pos++)
		{
			erster_teil += eingabe.at(pos);
		}

		for (int pos = vermeid_pos + 1; pos < eingabe.length(); pos++)
		{
			zweiter_teil += eingabe.at(pos);
		}
	}
	cout << "Der erste Teil der Zeichenkette lautet: " << erster_teil << endl;
	cout << "Der zweite Teil der Zeichenkette lautet: " << zweiter_teil << endl;
	system("PAUSE");
}

int main()
{
	char zeichen = 'a';
	string eingabe;
	string erster_teil;
	string zweiter_teil;
	int vermeid_pos = 0;
	bool in_text = false;

	cout << "Bitte geben Sie die einzeilige Zeichenkette ein: ? ";
	getline(cin, eingabe); //damit die ganze ding eingegeben wird

	cout << "Bitte geben Sie das Zeichen ein: ? ";
	cin >> zeichen;
	
	spalte_ab_erstem(zeichen, eingabe, erster_teil, zweiter_teil);

}