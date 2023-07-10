#include <iostream>
using namespace std;

#include "Address.h"
#include "Mail.h"
#include "Letter.h"
#include "Parcel.h"



/*

//12.09

    int main() 
{
    Mail amail(1020304);

    cout << "Bitte Absender angeben:" << endl;
    if (!amail.scan_from())
        cout << "Ungueltige eingabe!" << endl << endl;

    cout << "Und der Empfaenger:" << endl;
    if (!amail.scan_to())
        cout << "Ungueltige eingabe!" << endl;

    cout << amail << endl;
    cout << "... Post mit der ID " << amail.get_id();
    if (amail.deliver())
        cout << " wurde an " << amail.where_to().get_name()
        << " ausgeliefert!" << endl;
    else
        cout << " konnte nicht ausgeliefert werden!" << endl;

    system("pause");
    return 0;
}

//12.10

int main()
{
    // --- Briefe ---
    Address to("Boss, Anton", "Antonstr. 11", "23456 Hamburg");

    // Zwei Briefe ...
    Letter letter1(102030, EXPRESS),
        letter2(203040, Address{}, to, STANDARD);

    cout << "Die Briefe:" << endl << letter1 << letter2 << endl;

    cout << "Bitte Absender fuer Brief " << letter1.get_id()
        << " eingeben:" << endl;
    if (!letter1.scan_from())
        cout << "Ungueltige Eingabe!" << endl;

    cout << "und der Empfaenger:" << endl;
    if (!letter1.scan_to())
        cout << "Ungueltige Eingabe!" << endl;

    cout << "Die neuen Daten des Briefs: \n" << letter1 << endl;

    cout << "Ein Versuch, den Brief auszuliefern:" << endl;
    if (letter1.deliver())
        cout << "Brief mit der ID " << letter1.get_id()
        << " wurde ausgeliefert!\n" << endl;
    else
        cout << "Kein gueltiger Empfaenger!" << endl;
    
    system("PAUSE");
    return 0;
}
*/


//12.11

int main()
{
    // --- Briefe ---
    Address to("Boss, Anton", "Antonstr. 11", "23456 Hamburg");

    // Zwei Briefe ...
    Letter letter1(102030, EXPRESS),
        letter2(203040, Address{}, to, STANDARD);

    cout << "Die Briefe:" << endl << letter1 << letter2 << endl;

    cout << "Bitte Absender fuer Brief " << letter1.get_id()
        << " eingeben:" << endl;
    if (!letter1.scan_from())
        cout << "Ungueltige Eingabe!" << endl;

    cout << "und der Empfaenger:" << endl;
    if (!letter1.scan_to())
        cout << "Ungueltige Eingabe!" << endl;

    cout << "Die neuen Daten des Briefs: \n" << letter1 << endl;

    cout << "Ein Versuch, den Brief auszuliefern:" << endl;
    if (letter1.deliver())
        cout << "Brief mit der ID " << letter1.get_id()
        << " wurde ausgeliefert!\n" << endl;
    else
        cout << "Kein gueltiger Empfaenger!" << endl;

    // --- Pakete ---
    Parcel parcel1(500001, 2.5, true),
        parcel2(500002, Address("Bauer, Hans", "Feldweg 2",
            "88888 Einoed"), to, 10.7);

    cout << "Die Pakete:" << endl << parcel1 << parcel2 << endl;

    cout << "Bitte Empfaenger fuer Paket " << parcel1.get_id()
        << " eingeben:" << endl;
    if (!parcel1.scan_to())
        cout << "Ungueltige Eingabe!" << endl;
    if (parcel2.deliver())
        cout << "\nPaket mit der ID " << parcel2.get_id()
        << " und dem Gewicht " << parcel2.get_weight()
        << " wurde ausgeliefert!" << endl;

    system("PAUSE");
    return 0;
}