#include<iostream>
#include<string>
using namespace std;

struct Person
{
	string nachname, vorname;
	int alter;
	char geschlecht;
};

void filter(Person person[], int anzahl_personen)
{
	int wahl = 0;
	cout << "1 - Weibliche Erwachsene\n2 - Maennliche Erwachsene\n3 - Weibliche Kinder\n4 - Maennliche Kinder\n? ";
	cin >> wahl;
	int counter = 0;
	
	if (wahl == 1)
	{
		for (int i = 0; i < 100; i++)
		{
			if (person[i].geschlecht == 'w' && person[i].alter >= 18)
			{
				counter++;
				cout << person[i].nachname << ", ";
				cout << person[i].vorname << ", ";
				cout << person[i].geschlecht << ", ";
				cout << person[i].alter;
				cout << endl;
			}

		}
		cout << "Summe: " << counter << endl;
	}
	
	if (wahl == 2)
	{
		for (int i = 0; i < 100; i++)
		{
			if (person[i].geschlecht == 'm' && person[i].alter >= 18)
			{
				counter++;
				cout << person[i].nachname << ", ";
				cout << person[i].vorname << ", ";
				cout << person[i].geschlecht << ", ";
				cout << person[i].alter;
				cout << endl;
			}
		}
		cout << "Summe: " << counter << endl;
	}
	
	if (wahl == 3)
	{
		for (int i = 0; i < 100; i++)
		{
			if (person[i].geschlecht == 'w' && person[i].alter < 18)
			{
				counter++;
				cout << person[i].nachname << ", ";
				cout << person[i].vorname << ", ";
				cout << person[i].geschlecht << ", ";
				cout << person[i].alter;
				cout << endl;
			}

		}
		cout << "Summe: " << counter << endl;
	}
	
	if (wahl == 4)
	{
		for (int i = 0; i < 100; i++)
		{
			if (person[i].geschlecht == 'm' && person[i].alter < 18)
			{
				counter++;
				cout << person[i].nachname << ", ";
				cout << person[i].vorname << ", ";
				cout << person[i].geschlecht << ", ";
				cout << person[i].alter;
				cout << endl;
			}
		}
		cout << "Summe: " << counter << endl;
	}
}


int main()
{
	Person personen[100]{
{ "Musterfrau1", "Petra1", 18, 'w' },
{ "Mustermann1", "Klaus1", 18, 'm' },
{ "Mustermaedchen1", "Lisa1", 1, 'w' },
{ "Musterjunge1", "Jan1", 1, 'm' },
{ "Musterfrau2", "Petra2", 19, 'w' },
{ "Mustermann2", "Klaus2", 19, 'm' },
{ "Mustermaedchen2", "Lisa2", 2, 'w' },
{ "Musterjunge2", "Jan2", 2, 'm' },
{ "Musterfrau3", "Petra3", 20, 'w' },
{ "Mustermann3", "Klaus3", 20, 'm' },
{ "Mustermaedchen3", "Lisa3", 3, 'w' },
{ "Musterjunge3", "Jan3", 3, 'm' },
{ "Musterfrau4", "Petra4", 21, 'w' },
{ "Mustermann4", "Klaus4", 21, 'm' },
{ "Mustermaedchen4", "Lisa4", 4, 'w' },
{ "Musterjunge4", "Jan4", 4, 'm' },
{ "Musterfrau5", "Petra5", 22, 'w' },
{ "Mustermann5", "Klaus5", 22, 'm' },
{ "Mustermaedchen5", "Lisa5", 5, 'w' },
{ "Musterjunge5", "Jan5", 5, 'm' },
{ "Musterfrau6", "Petra6", 23, 'w' },
{ "Mustermann6", "Klaus6", 23, 'm' },
{ "Mustermaedchen6", "Lisa6", 6, 'w' },
{ "Musterjunge6", "Jan6", 6, 'm' },
{ "Musterfrau7", "Petra7", 24, 'w' },
{ "Mustermann7", "Klaus7", 24, 'm' },
{ "Mustermaedchen7", "Lisa7", 7, 'w' },
{ "Musterjunge7", "Jan7", 7, 'm' },
{ "Musterfrau8", "Petra8", 25, 'w' },
{ "Mustermann8", "Klaus8", 25, 'm' },
{ "Mustermaedchen8", "Lisa8", 8, 'w' },
{ "Musterjunge8", "Jan8", 8, 'm' }
	};

	int anzahl_personen = 32;
	char eingabe_person = ' ';
	int counter_person_nummer = 0;
	//int wahl = 0;
	do {

		do {
			cout << "Eine weitere Person eingeben (j/n)? Ihre Auswahl:" << endl;
			cin >> eingabe_person;
		} while (eingabe_person != 'j' && eingabe_person != 'n');

		if (eingabe_person == 'j')
		{
			counter_person_nummer++;
			string nachname;
			cout << "Bitte den Nachnamen der " << counter_person_nummer <<
				". Person eingeben: ? ";
			cin >> nachname;
			personen[31 + counter_person_nummer].nachname = nachname;

			string vorname;
			cout << "Bitte den Vorname der " << counter_person_nummer <<
				". Person eingeben: ? ";
			cin >> vorname;
			personen[31 + counter_person_nummer].vorname = vorname;

			int alter;
			cout << "Bitte den Alter der " << counter_person_nummer <<
				". Person eingeben: ? ";
			cin >> alter;
			personen[31 + counter_person_nummer].alter = alter;

			char geschlecht;
			cout << "Bitte das Geschlecht der " << counter_person_nummer <<
				". Person eingeben: ? ";
			cin >> geschlecht;
			personen[31 + counter_person_nummer].geschlecht = geschlecht;
			cout << personen[31 + counter_person_nummer].geschlecht << endl;
		}
		else if (eingabe_person == 'n')
		{
			filter(personen, anzahl_personen);
		}
	} while (eingabe_person == 'j');


	system("pause");
	return 0;
}