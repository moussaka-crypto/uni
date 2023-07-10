#include <iostream>
using namespace std;

int main()
{
	int zahl_1, zahl_2, zahl_3, zahl_4, zahl_5;
	int min, max, min_pos, max_pos;

	cout << "Bitte geben Sie die 1. Zahl ein: ? ";
	cin >> zahl_1;
	max = zahl_1; max_pos = 1;
	min = zahl_1; min_pos = 1;

	cout << "Bitte geben Sie die 2. Zahl ein: ? ";
	cin >> zahl_2;
	if (zahl_2 > zahl_1) 
	{ max = zahl_2; max_pos = 2; } // sofort mit Extremstellen vergleichen und ihre Werte veraendern, falls Bed. zutrifft
	
	else if (zahl_2 < zahl_1) 
	{ min = zahl_2; min_pos = 2;}

	cout << "Bitte geben Sie die 3. Zahl ein: ? ";
	cin >> zahl_3;
	if (zahl_3 > max) 
	{ max = zahl_3; max_pos = 3;}
	
	else if (zahl_3 < min) 
	{ min = zahl_3; min_pos = 3;}

	cout << "Bitte geben Sie die 4. Zahl ein: ? ";
	cin >> zahl_4;
	if (zahl_4 > max) 
	{ max = zahl_4; max_pos = 4;}
	
	else if (zahl_4 < min) 
	{ min = zahl_4; min_pos = 4;}

	cout << "Bitte geben Sie die 5. Zahl ein: ? ";
	cin >> zahl_5;
	if (zahl_5 > max) 
	{ max = zahl_5; max_pos = 5;}
	
	else if (zahl_5 < min) 
	{ min = zahl_5; min_pos = 5;}

	cout << "\nDie " << min_pos << ". Zahl war die kleinste der eingegebenen Zahlen und lautet: " << min << endl;
	cout << "\nDie " << max_pos << ". Zahl war die groesste der eingegebenen Zahlen und lautet: " << max << endl;

	return 0;
}