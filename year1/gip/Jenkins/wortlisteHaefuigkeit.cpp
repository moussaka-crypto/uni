#include <iostream>
#include <string>
using namespace std;

struct w_haeufigkeit {
	string wort;
	int haeufigkeit;
};
string naechstes_wort(string zeile, int& pos)
{
	string output = "";
	string wort = "";
	//Wenn die Position nicht auf einem Wort ist
	if (pos>= zeile.length())
		return "";
	if (pos == 0 && (zeile.at(0) == '.' || zeile.at(0) == ',' || zeile.at(0) == ' ')) {
		//Schleife die den ersten Buchstaben finden soll
		for (int i = 1; i < zeile.length(); i++) {
			if (isalpha(zeile.at(i))) {
				pos = i;
				break;
			}
		}
	}
	int minchar = pos;
	int maxchar = pos;
	//Ermitteln unterer Grenze
	for (int i = pos; i >= 0; i--) {
		if (zeile.at(i) == ' ' || zeile.at(i) == '.')	break;
		else minchar = i;
	}
	//Ermitteln der oberen Grenze
	for (int i = pos; i < zeile.length(); i++) {
		if (zeile.at(i) == ' ' || zeile.at(i) == '.' || i == zeile.length()) break;
		else maxchar = i;
	}
	//Ermitteln des zu spiegelnden Wortes
	for (int i = (minchar); i <= maxchar; i++) {
		output += zeile.at(i);
	}
	// Position wird auf den ersten Buchstaben, vom ersten folgenden Wert gesetzt.
	pos = maxchar + 1;
	if (pos >= zeile.length()) {
		pos = zeile.length();
	}
	else {
		if (!isalpha(pos)) {
			for (int i = pos; i < zeile.length(); i++) {
				if (isalpha(zeile.at(pos)))
					break;
				else
					pos++;
			}
		}
	}
	//Unnötige Satzzeichen entfernen
	string sfinal = "";
	for (int i = 0; i < output.length(); i++) {
		if (isalpha(output.at(i))) {
			sfinal += output.at(i);
		}
	}
	return sfinal;

}
void zaehle_wort(string wort, w_haeufigkeit haeufigkeiten[], int& w_count)
{
	bool vorhanden = false;
	int eine = 0;

	for (int i = 0; i <= w_count; i++) {
		if (haeufigkeiten[i].wort == wort) {
			haeufigkeiten[i].haeufigkeit++;
			vorhanden = true;
			break;
		}
	}
	//Wenn das Wort noch nicht vorgekommen ist
	if (vorhanden == false) {
		w_count++;
		haeufigkeiten[w_count - 1].haeufigkeit = 1;
		haeufigkeiten[w_count - 1].wort = wort;
	}
}

int main()
{
	int z_count = 0, w_count = 0;
	string wort = "";
	string eingabe[5];
	/* Eingabe hier, setzt auch z_count auf die Anzahl nicht-leerer Zeilen */
	bool weiter = true;
	string eingabestring = "";
	for (int i = 0; i < 5; i++) {
		if (weiter == true) {
			cout << "Eingabezeile = ? "; getline(cin, eingabestring);
			if (eingabestring == "")
				weiter = false;
			else {
				eingabe[i] = eingabestring;
				z_count++;
			}
		}
	}

		w_haeufigkeit haeufigkeiten[1000];
		for (int k = 0; k < z_count; k++)
		{
			int pos = 0;
			while (true)
			{
				wort = naechstes_wort(eingabe[k], pos);
				if (wort == "")
					break;
				zaehle_wort(wort, haeufigkeiten, w_count);
			}
		}
		for (int k = 0; k < w_count; k++)
			cout << haeufigkeiten[k].wort << ": " << haeufigkeiten[k].haeufigkeit << endl;
		system("PAUSE");
		return 0;
	
}