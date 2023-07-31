#include <iostream>
#include <string>
using namespace std;
#include "Liste.h"

// Beachte:
// Explizite Template-Instanziierung am Ende dieser Datei ...

template <typename T> 
void Liste<T>::hinten_anfuegen(T data) {
	TListenKnoten<T>* neuer_eintrag = new TListenKnoten<T>(data);
	if (anker == nullptr) anker = neuer_eintrag;
	else {
		TListenKnoten<T>* ptr = anker;
		while (ptr->next != nullptr) ptr = ptr->next;
		ptr->next = neuer_eintrag;
	}
}

template <typename T> 
void Liste<T>::liste_ausgeben() const {
	cout << "[ "; 
	TListenKnoten<T>* tmp = anker;
	while (tmp) 
	{ cout << tmp->data << (tmp->next /*!= nullptr*/ ? ", " : " "); tmp = tmp->next; }
	cout << "]" << endl;
}

// Explizite Template-Instanziierung ...
template class Liste<int>;
template class Liste<string>;
template class Liste<double>;
//template class TListenKnoten<int>;
//template class TListenKnoten<string>;