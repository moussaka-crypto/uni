#include "Mail.h"
#include <iostream>

bool Mail::deliver()
{
    if (to.is_valid()) {
        delivered = true;
        return delivered;
    }
    return false;
}

bool Mail::scan_to()
{
    return to.scan();
}

bool Mail::scan_from()
{
    return from.scan();
}

std::string Mail::delivery_text() const
{
    if (delivered) {
        return std::string("Ausgeliefert an ") + to.get_name();
    }
    return std::string("Noch nicht ausgeliefert!\n");
}

std::ostream& operator<<(std::ostream& stream, const Mail& m)
{
    stream << "Mail-ID: " << m.get_id() << std::endl;

    if (m.where_from().is_valid() == false) {
        stream << "Kein gueltiger Absender!\n";
    }
    else {
        stream << "Absender:\n" << m.where_from() << std::endl;
    }
    
    if (m.where_to().is_valid() == false) {
        stream << "Kein gueltiger Empfaenger!\n";
    }
    else {
        stream << "Empfaenger:\n" << m.where_to() << std::endl;
    }

    m.delivery_text();
    return stream;
}
