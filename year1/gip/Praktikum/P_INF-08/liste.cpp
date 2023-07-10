include <string>
#include "liste.h"

void hinten_anfuegen(TListenKnoten*& anker, const int wert)
{
	TListenKnoten* neuer_eintrag = new TListenKnoten;
	neuer_eintrag->data = wert;
	neuer_eintrag->next = nullptr;
	if (anker == nullptr)
		anker = neuer_eintrag;
	else
	{
		TListenKnoten* ptr = anker;
		while (ptr->next != nullptr)
			ptr = ptr->next;
		ptr->next = neuer_eintrag;
	}
}
std::string liste_als_string(TListenKnoten* anker)
{
	std::string resultat = "";
	if (anker == nullptr)
		return "Leere Liste.";
	else
	{
		resultat += "[ ";
		TListenKnoten* ptr = anker;
		do
		{
			resultat += std::to_string(ptr->data);
			if (ptr->next != nullptr) resultat += " , ";
			else resultat += " ";
			ptr = ptr->next;
		} while (ptr != nullptr);
		resultat += "]";
	}
	return resultat;
}