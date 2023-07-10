#include <iostream>
using namespace std;

int main()
{
	double geld_EUR = 0.0;
	cout << "Bitte geben Sie die Geldmenge in Euro ein: ? ";
	cin >> geld_EUR;

	double geld_USD = geld_EUR * 1.2957;
	cout << "Die Geldmenge in US Dollar lautet: " << geld_USD << endl;

	system("PAUSE");
	return 0;
}