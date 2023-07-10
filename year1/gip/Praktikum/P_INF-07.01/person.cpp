#include <string>
#include "Person.h"
#include "texte.h"
using namespace std;

Person extrahiere_person(string eingabezeile)
{
	Person p;
	string rest;

	spalte_ab_erstem(eingabezeile, ',', p.nachname, rest);
	spalte_ab_erstem(rest, ',', p.vorname, p.geburtsdatum);

	p.nachname = trimme(p.nachname);
	p.vorname = trimme(p.vorname);
	p.geburtsdatum = trimme(p.geburtsdatum);
	
	return p;
}