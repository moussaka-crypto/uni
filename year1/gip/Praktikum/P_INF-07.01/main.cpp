#include <iostream>
#include <string>
#include <fstream> 
#include "Person.h"
#include "texte.h"
using namespace std;

string br(string s) {

	return s += "<br/>";
}

string bold(string s) {

	string bold = "<b>" + s + "</b>"; //Fettschrift
	return bold; 
}

int main()
{
	string eingabezeile = "", kurztext = "", langtext = "";
	fstream personendaten("personendaten.txt", ios::in);

	while (getline(personendaten, eingabezeile)) {

		Person person = extrahiere_person(eingabezeile);

		kurztext += br(bold(person.nachname) + ", " + person.vorname) + "\n"; //kurztext
		langtext += br(bold(person.vorname + " " + person.nachname) + ", " + person.geburtsdatum) + "\n"; //langtext
	}
	personendaten.close();
	
	fstream templatedatei("webseite.html.tmpl", ios::in); //lesen
	fstream ausgabedatei("webseite.html", ios::out); //schreiben

	while (getline(templatedatei, eingabezeile)) {

		eingabezeile = ersetze(eingabezeile, '%', kurztext);
		eingabezeile = ersetze(eingabezeile, '$', langtext);

		eingabezeile += "\n";
		ausgabedatei << eingabezeile << endl;
		//cout << eingabezeile << endl;
	}
	templatedatei.close();
	ausgabedatei.close();
	return 0;
}