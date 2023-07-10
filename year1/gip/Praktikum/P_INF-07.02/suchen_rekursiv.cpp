#include "suchen_rekursiv.h"
using namespace std;

int zeichenkette_suchen_rekursiv(string text, string zkette,
	unsigned int text_pos,
	unsigned int text_such_pos,
	unsigned int zkette_such_pos)
{

	if (text_such_pos == text.length()) {
		cout << "Die Zeichenkette \'" << zkette << "\' ist NICHT in dem Text \'" << text << "\' enthalten." << endl;
		return -1;
	}

	char z = text.at(text_such_pos);
	if (z == zkette.at(zkette_such_pos)) {
		zkette_such_pos++;
	}
	else { zkette_such_pos = 0; } //wieder von vorne an beginnen, wenn Vergleich danach nicht stimmt

	if (zkette_such_pos == zkette.length()) {

		text_pos = text_such_pos - zkette_such_pos + 1; //wichtig!!!

		cout << "Die Zeichenkette \'" << zkette << "\' ist in dem Text \'" << text << "\' enthalten." << endl;
		cout << "Sie startet ab Zeichen " << text_pos << " (bei Zaehlung ab 0)." << endl;
		
		return text_pos;
	}

	return zeichenkette_suchen_rekursiv(text, zkette, text_pos, text_such_pos + 1, zkette_such_pos); //text_such_pos + 1 denn naechste pos mit rekursivfkt
}