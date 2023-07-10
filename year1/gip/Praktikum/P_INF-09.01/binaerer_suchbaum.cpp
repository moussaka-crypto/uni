#include "binaerer_suchbaum.h"
#include <iostream>

int suchbaum::einfuegen(BaumKnoten*& anker, int wert) 
{
	if (anker == nullptr) { //aktueller Knoten == nullptr => Leerer Baum

		BaumKnoten* neuer_eintrag = new BaumKnoten{wert, nullptr, nullptr};

		anker = neuer_eintrag;
		return 0;
	}

	if (anker->wert == wert) { //aktueller Knotenwert == einzufuegender Knotenwert => nichts hinzufuegen
		return 0;
	}

	if (anker->wert < wert) { //einzufuegender Wert > aktueller Wert => rechter Teil des Baums
		return einfuegen(anker->rechts, wert);
	}
	else //(anker->wert > wert)
		return einfuegen(anker->links, wert); //linker Teil des Baums
}

void suchbaum::knoten_ausgeben(BaumKnoten* knoten, int tiefe) {

	//Tut nichts, wenn aktueller Knoten leer, eine Rekursion zurueck
	if (knoten == nullptr) {
		return;
	}

	//Zuerst rechten Teil betrachten
	knoten_ausgeben(knoten->rechts, tiefe + 1);

	for (int i = 0; i < tiefe; i++) { 
		std::cout << "++"; 

	} //aktuellen Knoten ausgeben
	std::cout << knoten->wert << std::endl;

	//Linken teil des Baums betrachten, danach eine rekursion zurueck
	return knoten_ausgeben(knoten->links, tiefe + 1);
}

void suchbaum::ausgeben(BaumKnoten* anker) {
	if (anker == nullptr) std::cout << "Leerer Baum." << std::endl; //rekursion nicht notwendig, wenn Baum leer ist...
	knoten_ausgeben(anker, 0);
}