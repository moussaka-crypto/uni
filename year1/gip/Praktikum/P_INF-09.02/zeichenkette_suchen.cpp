#include <iostream>
#include "zeichenkette_suchen.h"
#include <cstring>
using namespace std;

unsigned int my_strlen(const char* ptr)
{
	int len = 0;
	while (ptr[len] != '\0') 
		len++;
	return len;
}

int zeichenkette_suchen(const char* text, const char* zkette) {

	int text_len = my_strlen(text);
	int zkette_len = my_strlen(zkette);

	for (int text_pos = 0; text_pos < text_len; text_pos++) { //vergleicht einzelne Positionen im Text mit Zkette

		if (text[text_pos] == zkette[0]) {

			int zkette_zaehler = 0; //zkette wird in text gezaehlt
			for (int i = text_pos; i < zkette_len + text_pos; i++) {

				if (text[i] == zkette[zkette_zaehler]) {

					zkette_zaehler++; //zaehlt durch zkette
				}
				else { break; } //Hinweis, wenn nicht 
				if (zkette_zaehler == zkette_len) { //zkette enthalten
					
					return text_pos; //(text_pos) hat den wert im Text, wo Zkette beginnt
				} 
			}
		}
	}
	return -1; //zkette nicht enthalten
}