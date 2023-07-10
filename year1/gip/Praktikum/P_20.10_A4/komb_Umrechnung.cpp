#include <iostream>
using namespace std;

int main()
{
	double eingabe, temp_F, laenge_Fuss, geld_USD;
	int auswahl;

	cout << "Ihre Eingabe: ? ";
	cin >> eingabe;

	cout << "Ihre Auswahl der Umwandlung: " << endl;
	cout << " 1 - Celsius in Fahrenheit" << endl; 
	cout << " 2 - Meter in Fuss" << endl; 
	cout << " 3 - Euro in US Dollar" << endl;
	
	cin >> auswahl;

	temp_F = ((3-auswahl)*0.5) * (2-auswahl) * ((eingabe * 1.8) + 32); //(3-1)*0.5 * (2-1) fuer auswahl == 1, alle andere Faelle == 0
	laenge_Fuss = (auswahl-1) * (3-auswahl) * (eingabe * 3.2808); //(1-2) * (3-2) fuer auswahl == 2, alle andere Faelle == 0
	geld_USD = (auswahl-2) * ((auswahl-1)*0.5) * (eingabe * 1.2957); //(2-3) * 0.5*(1-3) fuer auswahl == 3, alle andere Faelle == 0

	double ergebnis = temp_F + laenge_Fuss + geld_USD;
	cout << "Das Ergebnis lautet: " << ergebnis << endl;

	system("PAUSE");
	return 0;
}