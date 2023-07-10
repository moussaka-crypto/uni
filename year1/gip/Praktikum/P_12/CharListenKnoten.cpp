#include "CharListenKnoten.h"

int CharListenKnoten::next_available_id = 1;
int CharListenKnoten::object_count = 0;

void hinten_anfuegen(CharListenKnoten*& anker, const char wert) 
{
	CharListenKnoten* neues_element = new CharListenKnoten(wert);
	neues_element->set_next(nullptr);

	if (anker == nullptr) anker = neues_element;
	else
	{
		CharListenKnoten* ptr = anker;
		while (ptr->get_next() != nullptr)
		{
			ptr = ptr->get_next();
		}
		ptr->set_next(neues_element);
	}
}

void loesche_alle(CharListenKnoten*& anker)
{
	if (anker == nullptr) return;
	else
	{
		CharListenKnoten* seeker = anker;
		CharListenKnoten* terminator = nullptr;
		while(seeker != nullptr)
		{
			terminator = seeker;
			seeker = seeker->get_next();
			delete terminator;
		}
		anker = nullptr;
	}
}

CharListenKnoten* deep_copy(CharListenKnoten* orig)
{
	if (orig == nullptr) return orig;
	
	CharListenKnoten* copy = new CharListenKnoten(orig->get_data());
	copy->set_next(deep_copy(orig->get_next())); //rekursiv, damit next ptr aus vorheriger Kopie stammt
	//return copy;
}

