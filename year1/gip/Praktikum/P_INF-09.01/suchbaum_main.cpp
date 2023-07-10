// Datei: suchbaum_main.cpp

#define CATCH_CONFIG_RUNNER
#include "catch.h"
#include "binaerer_suchbaum.h"
#include <iostream>
using namespace std;
using namespace suchbaum;



int main()
{
    // Aufruf der Unit Tests ...
    Catch::Session().run();

    // Ihr Code ab hier ...
    BaumKnoten* anker = nullptr; //Knoten leer
    int tiefe = 0;

    ausgeben(anker);

    int wert = 0;
    do {
        cout << "Naechster Wert (99 beendet): ? "; //Zahlen eingeben
        cin >> wert;

        if (wert >= 0 && wert <= 98) { //Knoten machen, bis wert 99
            einfuegen(anker, wert); // anker und wert fuer ersten Knoten
        }    
    } while (wert != 99);

    ausgeben(anker);
   

    system("PAUSE");
    return 0;
}
