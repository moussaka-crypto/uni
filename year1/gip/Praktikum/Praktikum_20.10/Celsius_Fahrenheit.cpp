#include <iostream>
using namespace std;

int main()
{
	double temp_Celsius = 0.0;
	cout << "Bitte geben Sie die Temperatur in Grad Celsius ein: ? ";
	cin >> temp_Celsius;

	double temp_Fahrenheit = (temp_Celsius * 1.8) + 32;
	cout << "Die Temperatur in Fahrenheit lautet: " << temp_Fahrenheit << endl;

	system("PAUSE");
	return 0;

}