#include <iostream>
using namespace std;

int main()
{
	int auftrag, gesamt_Betrag;
	cout << "Bitte geben Sie die Auftragssumme ein: ? ";
		cin >> auftrag;
			cout << "Auftragssumme: " << auftrag << " Euro" << endl;

	if (auftrag > 0 && auftrag < 300)
	{
		int verpackung = 10, versand = 15; // alternativ keine verpackung und versand variablen initialisieren und nur mit 15, 10 und 5 rechnen

		cout << "Verpackungszuschlag: " << verpackung << " Euro" << endl;
		cout << "Versandkosten: " << versand << " Euro" <<  endl;

		gesamt_Betrag = auftrag + verpackung + versand;
		cout << "Gesamtbetrag: " << gesamt_Betrag << " Euro" << endl;
	}
	else if (auftrag >= 300 && auftrag < 1000)
	{
		int verpackung = 5, versand = 0;

		cout << "Verpackungszuschlag: " << verpackung << " Euro" << endl;
		cout << "Versandkosten: " << versand << " Euro" << endl;

		gesamt_Betrag = auftrag + verpackung + versand;
		cout << "Gesamtbetrag: " << gesamt_Betrag << " Euro" << endl;
	}
	else if (auftrag >= 1000)
	{
		int verpackung = 0, versand = 0;

		cout << "Verpackungszuschlag: " << verpackung << " Euro" << endl;
		cout << "Versandkosten: " << versand << " Euro" << endl;

		gesamt_Betrag = auftrag + verpackung + versand;
		cout << "Gesamtbetrag: " << gesamt_Betrag << " Euro" << endl;
	}
	else
	{
		cout << "Ave ei selski tarikat" << endl;
	}
	system("PAUSE");
	return 0;
}