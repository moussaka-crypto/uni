#include "Logged_Obj.h"
using namespace std;

void Logged_Object::log(string text) { file << text << endl; }

//void Logged_Object::log_cpp(string text)
//{
//	log(string(">>>>> ") + text + " <<<<<\n");
//}

Logged_Object::Logged_Object() : //Initialisierungsliste
	id{generate_unique_id()},
	int_attribut{id},
	file{generate_filename(), ios::out} 
{
	log(string("Object created (Default Constructor): id ") + to_string(id) + ", value " + to_string(int_attribut));
}

Logged_Object::~Logged_Object() // nur um file attribut kuemmern //Rule of 3 Teil 1 - Destruktor
{
	file.close();
	log(string("Object deleted (Destructor): id ") + to_string(id) + ", value " + to_string(int_attribut));
}

Logged_Object::Logged_Object(const Logged_Object& orig) : //Rule of 3 Teil 2 - Copy Konstruktor // Referenzparameter, damit wert nicht kopiert wird
	id{ generate_unique_id() },
	int_attribut{ orig.int_attribut },
	file{ generate_filename(), ios::out }
{
	log(string("Object created (Copy Constructor): id ") + to_string(id) + ", value " + to_string(int_attribut));
}

Logged_Object& Logged_Object::operator =(const Logged_Object& orig) //Rule of 3 Teil 3 - (Assignment) Operator 
																	// Rueckgabewert ist die Klasse selbst, als Original uebernommen
																	//sonst mit einer Kopie der Klasse arbeiten
{
	int_attribut = orig.int_attribut;
	// id und file bleiben unveraendert

	log(string("Object got new value assigned: id ") + to_string(id) + ", new value " + to_string(int_attribut));

	return *this; //pointer auf aktuelles objekt dereferenzieren
}

