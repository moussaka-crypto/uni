#pragma once
#include <string>

struct TListenKnoten
{
	int data;
	TListenKnoten* next;
};

void hinten_anfuegen(TListenKnoten*& anker, const int wert);

std::string liste_als_string(TListenKnoten* anker);