//Datei: sortiere_template.cpp

using namespace std;
#include "sortiere_template.h"
#include <string>

template <typename T1> 
void sortiere(T1 array[], int length)
{
	// so oft wie das Array Eintraege hat: wiederhole
	for (int i1 = 0; i1 < length; i1++)
	{
		//Laufe von links nach rechts durch Array
		for (int index = 0; index < length - 1; index++)
		{
			//Vergleiche jeden Eintrag mit seinem rechten Nachbarn
			//Tausche, wenn "falsch herum"
			//Hier: Vergleich, ggf. Tausch
			if (array[index] > array[index + 1]) {

				T1 temp = array[index];
				array[index] = array[index + 1];
				array[index + 1] = temp;
			}
		}
	}
} // template der Fkt fuer den Vergleich verschiedener Datentypen

//Anweeisung an Template-System:
//
//Erzeuge die sortiere<int>, weil es eine andere .cpp datei gibt, welche diese Variante benoetigt
template void sortiere<int>(int array[], int length);

//Erzeuge die sortiere<string>, weil es eine andere .cpp datei gibt, welche diese Variante benoetigt
template void sortiere<string>(string array[], int length);
