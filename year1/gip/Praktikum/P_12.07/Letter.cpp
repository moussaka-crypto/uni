#include "Mail.h"
#include "Letter.h"
#include <iostream>

std::string Letter::delivery_text() const
{
    if (delivered) {
        std::cout << "Brief: ";
        return std::string("Ausgeliefert an ") + to.get_name();
    }
    return std::string("Noch nicht ausgeliefert!\n");
}

std::ostream& operator<<(std::ostream& stream, const Letter& l)
{
    std::cout << "--- Brief-Daten ---\n";
    if (l.get_ctg() == STANDARD) {
        stream << "Kategorie: Standard\n";
    }
    else {
        stream << "Kategorie: Express\n";
    }
    
    stream << static_cast<Mail> (l) // trimmen von Letter, bleibt nur Mail Attribute und Methoden 
           << l.delivery_text();
    return stream;
}

//WICHTIG!!!!

//Person* p = new Student(...); //Downcast
// Student* s = new PErson(...); //Upcast
//
//Student* s = dynamic_cast<Student*> (p); //explizit sagen, dass Student ein Cast auf Person ist, dann direkt auf Student Methoden zugreifen
//s->student_method();
