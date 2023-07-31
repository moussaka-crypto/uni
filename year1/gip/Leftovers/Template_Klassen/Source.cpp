#include <iostream>
#include <string>
using namespace std;
#include "Liste.h"

int main()
{
	Liste<int> my_list, my_list2;
	my_list.liste_ausgeben(); 
	my_list.hinten_anfuegen(4); 
	my_list.hinten_anfuegen(5); 
	my_list.liste_ausgeben(); 
	system("Pause");

	cout << endl << endl;
	my_list2.liste_ausgeben(); 
	my_list2.hinten_anfuegen(4); 
	my_list2.liste_ausgeben(); cout << endl << endl;
	system("Pause");

	Liste<string> s_list;
	s_list.liste_ausgeben();
	s_list.hinten_anfuegen("data1"); 
	s_list.hinten_anfuegen("data2"); 
	s_list.hinten_anfuegen("data3"); 
	s_list.liste_ausgeben();

	system("Pause");
	Liste<double> d_list;
	d_list.liste_ausgeben();
	d_list.hinten_anfuegen(5.6);
	d_list.hinten_anfuegen(5.8); 
	d_list.hinten_anfuegen(43); 
	d_list.hinten_anfuegen(321.2); 
	d_list.hinten_anfuegen(9302);
	d_list.liste_ausgeben();

	system("PAUSE");
	return 0;
}