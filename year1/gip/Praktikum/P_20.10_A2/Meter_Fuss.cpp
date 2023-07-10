#include <iostream>
using namespace std;

int main()
{
	double laenge_Meter = 0.0;
	cout << "Bitte geben Sie die Laenge in Metern ein: ? ";
	cin >> laenge_Meter;

	double laenge_Fuss = laenge_Meter * 3.2808;
	cout << "Die Laenge in Fuss lautet: " << laenge_Fuss << endl;

	system("PAUSE");
	return 0;
}