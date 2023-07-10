#include <string>
using namespace std;

void spalte_ab_erstem(string eingabe, char zeichen, string& erster_teil, string& zweiter_teil)
{
	int i = 0;
	for (; i < eingabe.length(); i++)
	{
		if (eingabe.at(i) == zeichen)
		{
			i++;
			break;
		}
		else
		{
			erster_teil += eingabe.at(i);
		}
	}
	for (; i < eingabe.length(); i++)
	{
		zweiter_teil += eingabe.at(i);
	}
}

string trimme(string s)
{
	string ergebnis = "";

	for (int i = 0; i < s.size(); i++)
	{
		if (s.at(i) != ' ')
		{
			ergebnis += s.at(i);
		}
	}
	return ergebnis;
}

string ersetze(string s, char zuersetzen, string ersatztext)
{
	string result = "";
	for (int i = 0; i < s.size(); i++)
	{
		if (s.at(i) == zuersetzen)
			result += ersatztext;
		else
			result += s.at(i);
	}
	return result;
}