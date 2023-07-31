#include "rechteck.h"
#include <iostream>

bool vergleiche_flaechen(Rechteck& a, Rechteck& b)
{
	int fl_1 = a.length * a.width;
	int fl_2 = b.length * b.width;
	return fl_1 == fl_2;

	//if (fl_1 == fl_2){
	//	std::cout << "Der Flaecheninhalt beider Rechtecke ist gleich.";
	//}
	//else {
	//	std::cout << "Der Flaecheninhalt beider Rechtecke ist ungleich.";
	//}
}

