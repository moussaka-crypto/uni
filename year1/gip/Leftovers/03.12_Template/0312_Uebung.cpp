#include <iostream>
#include <string>
using namespace std;

#include "sortiere_template.h"


int main()
{
	const int len = 5;

	/*int int_array[] = { 6, 9, 4, 2, 0 };
	string str_array[] = {"Hrii","Kolio","Ivak","Marto","Koce"};*/
	int int_array[] = {5, 7, 2, 9, 3};
	string str_array[] = {"cccdef","aaa","fff","ddd","zzzabc"};

	//aufruf der sortiere fkt fuer jeden Datentyp
	sortiere<int>(int_array, len);
	sortiere<string>(str_array, len);

	for (int i = 0; i < len; i++)
		cout << int_array[i] << " ";
	cout << endl;

	for (int i = 0; i < len; i++)
		cout << str_array[i] << " ";
	cout << endl;

	//explizite Instanzierung - besser fuer grosse Projekte
	

	system("pause");
	return 0;
}