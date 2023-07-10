// Datei: zeichenkette_suchen_main.cpp

#define CATCH_CONFIG_RUNNER
#include "catch.h"

#include <iostream>
#include <string>
using namespace std;

#include "zeichenkette_suchen.h"

int main()
{
    // Aufruf der Unit Tests ...
    Catch::Session().run();

    // Ihr Code ab hier ...

    //char text[max_len] = { 0 };
    //char zkette[max_len] = { 0 };
    
    char text[max_len] = "";
    char zkette[max_len] = "";

    cout << "Bitte geben Sie den Text ein: ";
    cin.getline(text, max_len);
    cout << "bitte geben sie die zu suchende zeichenkette ein: ";
    cin.getline(zkette, max_len);

 /*    do {
          cout << "bitte geben sie die zu suchende zeichenkette ein: ";
          cin.ignore('\n');
          cin.getline(zkette, max_len);
          
    } while (zkette == "");*/
    int zk_result = zeichenkette_suchen(text, zkette);
    if (zk_result == -1)
        cout << "Die Zeichenkette '" << zkette << "' ist NICHT in dem Text '" << text << "' enthalten." << endl;
    else
        cout << "Die Zeichenkette '" << zkette << "' ist in dem Text '" << text << "' enthalten." << endl;
        cout << "Sie startet ab Zeichen " << zk_result << " (bei Zaehlung ab 0)." << endl;

    system("PAUSE");
    return 0;
}
