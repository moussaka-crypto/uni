#pragma once

namespace suchbaum
{
	struct BaumKnoten {
		int wert;
		BaumKnoten* links;
		BaumKnoten* rechts;
	};

	int einfuegen(BaumKnoten*& anker, int wert); //Promqna v lista permanentna
	void knoten_ausgeben(BaumKnoten* knoten, int tiefe);
	void ausgeben(BaumKnoten* anker);
}
