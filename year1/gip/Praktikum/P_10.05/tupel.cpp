#include <string>
#include <iostream>
#include "tupel.h"
using namespace std;

template <typename T1, typename T2>
int vergleiche(Tupel <T1, T2> p1, Tupel <T1, T2> p2)
{
	if (p1.komponente1 < p2.komponente1 && p1.komponente2 < p2.komponente2) 
		return -1;
		
	else if (p1.komponente1 > p2.komponente1 && p1.komponente2 > p2.komponente2) 
		return +1; 
	
	return 0;
}
	template int vergleiche <string, int> (Tupel <string, int> p1, Tupel <string, int> p2);
	template int vergleiche <int, int> (Tupel <int, int> p1, Tupel <int, int> p2);

	/*template int vergleiche <double, int>(Tupel<double, int> p1, Tupel <double, int> p2);
	template int vergleiche <string, double>(Tupel<string, double> p1, Tupel <string, double> p2);
	template int vergleiche <int, int>(Tupel<int, int> p1, Tupel <int, int> p2);*/

	//explizite Instanzierung - Kompiler wird benachrichtigt, 
	//Template == Schablone, wenn nicht benutzt fuehrt zu nichts