// Datei: tupel_main.cpp

#include <string>
#include <iostream>
#include "tupel.h"
using namespace std;

int main()
{
	Tupel<string, int> hansi = { "Hansi", 8 };
	Tupel<string, int> willi = { "Willi", 77 };

	cout << vergleiche<string, int>(hansi, willi) << endl;

	Tupel<int, int> t1 = { 3 , 4 };
	Tupel<int, int> t2 = { 1 , 2 };

	cout << vergleiche<int, int>(t1, t2) << endl;

	Tupel<int, int> t3 = { 9 , 1 };
	Tupel<int, int> t4 = { 3 , 5 };
	
	cout << vergleiche<int, int>(t3, t4) << endl;
	//////////////////////////////////////////////////////////
	Tupel<double, int> t5 = { 7.6, 9 };
	Tupel<double, int> t6 = { 2.4, 14 };

	cout << vergleiche<double, int>(t5, t6) << endl;

	Tupel<string, double> t7 = { "Ivak", 7.11 };
	Tupel<string, double> t8 = { "Marto", 22.9 };

	cout << vergleiche<string, double>(t7, t8) << endl;

	Tupel<int, int> t9 = { 69, 420 };
	Tupel<int, int> t10 = { 47, 419 };

	cout<< vergleiche<int, int>(t9, t10) << endl;

	system("PAUSE");
	return 0;
}
