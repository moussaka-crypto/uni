#include <iostream>
using namespace std;

int main()
{
	double seitenlaenge, umfang, flaeche = 0;

	cout << "Bitte geben Sie die Seitenlaenge ein (in cm): ? ";
	cin >> seitenlaenge;

	cout << "Der Umfang des Quadrats betraegt (in cm): " << 4 * seitenlaenge << endl;
	cout << "Die Flaeche des Quadrats betraegt (in cm*cm): " << seitenlaenge * seitenlaenge << endl;

	system("PAUSE");
	return 0;
}