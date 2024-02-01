// Datei: main.cpp

#include <iostream>
using namespace std;

#include "Mail.h"

int main()
{
   Mail aMail(1020304);

    cout << "Bitte Absender angeben:" << endl;
    if (!aMail.scan_from())
       cout << "Ungueltige Eingabe!" << endl << endl;

    cout << "und der Empfaenger:" << endl;
    if (!aMail.scan_to())
       cout << "Ungueltige Eingabe!" << endl;

    cout << aMail << endl;
    cout << "... Post mit der ID " << aMail.get_id();
    if (aMail.deliver())
       cout << " wurde an " << aMail.where_to().get_name()
       << " ausgeliefert!" << endl;
    else
       cout << " konnte nicht ausgeliefert werden!" << endl;

    system("PAUSE");
    return 0;
}
