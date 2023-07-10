 //Datei: suchen_rekursiv_main.cpp

#define CATCH_CONFIG_RUNNER
#include "catch.h"

#include <iostream>
using namespace std;

#include "suchen_rekursiv.h"

int main()
{
    Catch::Session().run();
    // Ihr Code ab hier ...

    string text, zeichenkette;
    cout << "Bitte geben Sie den Text ein: ";
    getline(cin, text);
    cout << "Bitte geben Sie die zu suchende Zeichenkette ein: ";
    getline(cin, zeichenkette);

    zeichenkette_suchen_rekursiv(text, zeichenkette);

    system("PAUSE");
    return 0;
}