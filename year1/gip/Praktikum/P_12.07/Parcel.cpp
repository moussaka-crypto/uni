#include "Mail.h"
#include "Parcel.h"
#include <iostream>

std::string Parcel::delivery_text() const
{
    std::cout << "Parcel: ";
    if (delivered == true) {
        return std::string("Ausgeliefert an ") + to.get_name();
    }
    return std::string("Noch nicht ausgeliefert!\n");
}

std::ostream& operator<<(std::ostream& stream, const Parcel& p)
{
    stream << "---Paket - Daten---\n";
    
    stream << "Gewicht: " << p.get_weight(); 
    if (p.get_insured() == true) {
        stream << " / Versichert \n";
    }
    else {
        stream << " / Nicht versichert \n";
    }

    stream << static_cast<Mail> (p) // trimmen von Parcel, bleibt nur Mail Attribute und Methoden 
        << p.delivery_text();
    return stream;
}
