#include "Raumschiff.h"
#include <iostream>
using namespace std;

int main()
{
	Raumschiff mein_raumschiff;
	cin >> mein_raumschiff.name;

	int x1 = 0, y1 = 0;
	do {
		cin >> x1;
		cin >> y1;

	} while (!(mein_raumschiff.set_coordinates(x1, y1)));

	mein_raumschiff.set_x(22);

	Raumschiff* raumschiff_ptr = new Raumschiff;
	raumschiff_ptr->name = string("Millenium Falcon");
	raumschiff_ptr->set_x(11);
	raumschiff_ptr->set_y(22);

	system("pause");
	return 0;
}
