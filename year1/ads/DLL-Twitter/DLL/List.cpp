#include "List.h"

List::List()
{
    /*
        Konstruktor für eine leere Liste
    */
    head_tail = new Node;
    list_size = 0;
    temp = false;
    head_tail->next = head_tail;
    head_tail->prev = head_tail;
}

List::List(const List& _List)
{
    /*
        Konstruktor mit Übergabe einer Liste, die dann kopiert wird.
        in dem Objekt _List sind die Knotenwerte enthalten, die Kopiert werden
        sollen.
    */
    list_form = _List.list_form;
    head_tail = new Node;
    list_size = 0;
    temp = _List.temp;
    head_tail->next = head_tail;
    head_tail->prev = head_tail;
    Node* tmp_node;
    tmp_node = _List.head_tail->next;
    while (tmp_node != _List.head_tail) //kopieren der Elemente von _List
    {
        head_tail->prev =
            new Node(tmp_node->value, head_tail->prev->next, head_tail->prev);
        head_tail->prev->prev->next = head_tail->prev;
        list_size++;
        tmp_node = tmp_node->next;
    }
    /*
        Ist die übergebene Liste eine temporäre Liste? -> aus Operator +
    */
    if (_List.temp)
        delete& _List;
}

List::~List()
{
    //ToDo
/*
    Dekonstruktor
    Alle Knoten der Liste müssen gelöscht werden, wenn die Liste gelöscht wird.
*/
    while (head_tail->next != head_tail) { //Liste nicht leer

        Node* ptr = head_tail->next->next;
        delete head_tail->next;
        
        head_tail->next = ptr;
        ptr->prev = head_tail;

        //Node* ptr = head_tail->next;
        //ptr->next->prev = ptr->prev;
        //head_tail->next = ptr->next;
        //delete ptr;

        list_size--;
    }

}

void List::insertFront(int value)
{
    //ToDo
/*
    Einfuegen eines neuen Knotens am Anfang der Liste
    Einen neuen Knoten mit dem Wert value wird am Anfang der Liste einfügen
*/
    Node* neuer_eintrag = new Node(value, head_tail, head_tail);
    if (head_tail->next == head_tail) { //leere Liste
        head_tail->prev = neuer_eintrag;
        head_tail->next = neuer_eintrag;
    }
    else {
        neuer_eintrag->next = head_tail->next;
        neuer_eintrag->next->prev = neuer_eintrag;
        head_tail->next = neuer_eintrag;
    }
    list_size++;
}

void List::insertFront(List& _List)
{
    //ToDo

    if (!(head_tail == _List.head_tail)) {

        this->head_tail->next->prev = _List.head_tail->prev;
        _List.head_tail->prev->next = this->head_tail->next;

        this->head_tail->next = _List.head_tail->next;
        _List.head_tail->next->prev = this->head_tail;

        _List.head_tail->next = _List.head_tail; //_List leeren
        _List.head_tail->prev = _List.head_tail;
        this->list_size += _List.list_size;
    }
    else
        return;
    /*
    Einfuegen der Liste _List AM ANFANG einer vorhandenen Liste
    Die einzufuegenden Knoten werden uebernommen (nicht kopiert)
    Die einzufuegende Liste _List ist anschließend leer.
    Es darf keine Schleife und kein new benutzt werden.
*/

/*
    gleiches Objekt -> keine Aktion
*/
    /*
        Es wird ein Objekt übergeben in dem Knoten vorhanden sein können.
        Diese Knoten (koplette Kette) werden an den Anfang der Liste (this) übertragen ohne sie zu kopieren!
        Die Liste _List ist danach leer, aber vorhanden.
    */

}

void List::insertBack(int value)
{
    //ToDo
/*
    Einfuegen eines neuen Knotens am Ende der Liste
    Einen neuen Knoten mit dem Wert value wird am Ende der Liste einfügen
*/
    Node* neuer_eintrag = new Node(value, head_tail, head_tail);
    if (head_tail->next == head_tail) {
        head_tail->prev = neuer_eintrag;
        head_tail->next = neuer_eintrag;
    }
    else {
        neuer_eintrag->prev = head_tail->prev;
        neuer_eintrag->prev->next = neuer_eintrag;
        head_tail->prev = neuer_eintrag;
    }
    list_size++;
}

void List::insertBack(List& _List)
{
    //ToDo
    
    if (!(head_tail == _List.head_tail)) {
        this->head_tail->prev->next = _List.head_tail->next;
        _List.head_tail->next->prev = this->head_tail->prev;

        _List.head_tail->prev->next = this->head_tail;
        this->head_tail->prev = _List.head_tail->prev;

        _List.head_tail->next = _List.head_tail; //_List leeren
        _List.head_tail->prev = _List.head_tail;
        this->list_size += _List.list_size;
    }
    else
        return;
/*
    Einfuegen der Liste _List AM ENDE einer vorhandenen Liste
    Die einzufuegenden Knoten werden uebernommen (nicht kopiert)
    Die einzufuegende Liste _List ist anschließend leer.
    Es darf keine Schleife und kein new benutzt werden.
*/

/*
    gleiches Objekt -> keine Aktion
*/

    /*
        Es wird ein Objekt übergeben in dem Knoten vorhanden sein können.
        Diese Knoten (koplette Kette) werden an den Ende der Liste (this) übertragen ohne sie zu kopieren!
        Die Liste _List ist danach leer, aber vorhanden.
    */


}

bool List::getFront(int& value)
{
    //ToDo
    if (!list_size || head_tail == head_tail->next) //leere Liste
        return false;
    else {
        Node* terminator = head_tail->next;
        value = head_tail->next->value;

        terminator->prev->next = terminator->next;
        terminator->next->prev = terminator->prev;
        delete terminator;
        list_size--;

        return true;
    }
/*
    entnehmen des Knotens am Anfang der Liste
    der Wert wird als Parameter zurueckgegeben
    der Knoten wird entnommen
    im Fehlerfall wird false zurückgegeben
*/

/*
    gleiches Objekt -> keine Aktion
*/

    /*
        Der Wert des vorderen Knotens wird rückgegeben und der Knoten gelöscht.
        Die Methode del(value) darf nicht zum löschen benutzt werden.
    */
}

bool List::getBack(int& value)
{
    //ToDo
    if (!list_size || head_tail == head_tail->next) //leere Liste
        return false;
    else {
        Node* terminator = head_tail->prev;
        value = head_tail->prev->value;

        terminator->prev->next = terminator->next;
        terminator->next->prev = terminator->prev;
        delete terminator;
        list_size--;

        return true;
    }

/*
    entnehmen des Knotens am Ende der Liste
    der Wert wird als Parameter zurueckgegeben
    der Knoten wird entnommen
    im Fehlerfall wird false zurückgegeben
*/

/*
    gleiches Objekt -> keine Aktion
*/

    /*
        Der Wert des letzten Knotens wird rückgegeben und der Knoten gelöscht.
        Die Methode del(value) darf nicht zum löschen benutzt werden.
    */

}

bool List::del(int value)
{
    //ToDo
    if (!list_size || head_tail == head_tail->next)
        return false;
    else {
        Node* terminator = head_tail->next;
        while (terminator != head_tail) {

            if (terminator->value == value) {
                
                terminator->prev->next = terminator->next;
                terminator->next->prev = terminator->prev;
                delete terminator;
                list_size--;
                return true;
            }
            terminator = terminator->next;
        }
        return false;
    }
/*
    Loeschen eines gegebenen Knotens
    im Fehlerfall wird false zurückgegeben
*/

/*
    gleiches Objekt -> keine Aktion
*/

    /*
        Löschen des Knotens mit dem Wert value
    */
}

bool List::search(int value)
{
    //ToDo
    if (!list_size || head_tail == head_tail->next)
        return false;
    else {
        Node* seeker = head_tail->next;
        while (seeker != head_tail) {

            if (seeker->value == value) {
                return true;
            }
            seeker = seeker->next;
        }
        return false;
    }

/*
    suchen eines Knotens
    nicht gefunden -> Rueckgabe: false
*/

/*
    leere Liste -> keine Aktion
*/
    /*
        suchen ob ein Knoten mit dem Wert value existiert.
    */


}

bool List::swap(int value1, int value2)
{
    //ToDo

    if (list_size < 2 || value1 == value2) //kein Sinn gleiche Werte zu tauschen
        return false;
    else {
        Node* ptr1 = nullptr;
        Node* ptr2 = nullptr;
        Node* seeker = head_tail->next;
        bool f1 = false, f2 = false; // f = value found

        while (seeker != head_tail) {

            if (seeker->value == value1) {
                ptr1 = seeker;
                f1 = true;
            }

            if (seeker->value == value2) {
                ptr2 = seeker;
                f2 = true;
            }

            if (f1 && f2)
                break;

            if (seeker->next == head_tail) //Liste durchgegangen, nichts gefunden
                return false;

            seeker = seeker->next;
        }
        //Nodes nebeneinander - 2 Fälle
        if (ptr1->next == ptr2) {//v1, v2 

            ptr1->next = ptr2->next;
            ptr2->next->prev = ptr1;
            ptr2->next = ptr1;
            ptr2->prev = ptr1->prev;
            ptr1->prev->next = ptr2;
            ptr1->prev = ptr2;
        }

        else if (ptr1->prev == ptr2) { //v2, v1 //ptr1 und ptr2 vertauschen

            ptr2->next = ptr1->next;
            ptr1->next->prev = ptr2;
            ptr1->next = ptr2;
            ptr1->prev = ptr2->prev;
            ptr2->prev->next = ptr1;
            ptr2->prev = ptr1;
        }
        //Nodes nicht nebeneinander - Reihenfolge egal
        else {
            Node* old_ptr1_p = ptr1->prev;
            Node* old_ptr1_n = ptr1->next;

            ptr1->next->prev = ptr2;
            ptr1->next = ptr2->next;
            ptr1->prev->next = ptr2;
            ptr1->prev = ptr2->prev;

            ptr2->next->prev = ptr1;
            ptr2->next = old_ptr1_n;
            ptr2->prev->next = ptr1;
            ptr2->prev = old_ptr1_p;
        }
        return true;
    }

/*
    Vertauschen von zwei Knoten
    Dabei werden die Zeiger der Knoten und deren Nachbarn veraendert.
    im Fehlerfall wird false zurueckgegeben
*/

/*
    Wenn Liste Leer oder weniger als 2 Knoten besitzt -> Keine Aktion
*/
    /*
        Vertauschen von zwei Knoten mit dem Wert value1 und dem Wert value2.
        Es duerfen nicht nur einfach die Werte in den Knoten getauscht werden!
        Die Knoten sind in der Kette umzuhaengen.
    */
}

int List::size(void)
{
    //ToDo
    return list_size;
/*
    Rueckgabe der Anzahl der Knoten in der Liste mit O(1)
    d.h. die Liste darf NICHT traversiert werden um die Größe zu bestimmen.

    Anzahl der Knoten in der Liste zurückgeben.
    Hier richtiges Ergebnis zurückgeben
*/
}

bool List::test(void)
{
    // Testmethode: die Methode durchläuft die Liste vom Anfang bis zum Ende und
    // zurück Es werden dabei die Anzahl der Knoten gezahlt. Stimmt die Anzahl
    // der Knoten überein liefert die Methode true
    Node* tmp = head_tail->next;
    int   i_next = 0, i_prev = 0;
    while (tmp != head_tail)
    {
        tmp = tmp->next;
        if (i_next > list_size)
            return false;
        i_next++;
    }
    if (i_next != list_size)
        return false;
    tmp = head_tail->prev;
    while (tmp != head_tail)
    {
        tmp = tmp->prev;
        if (i_prev > list_size)
            return false;
        i_prev++;
    }
    return i_prev == i_next;
}

List& List::operator=(const List& _List)
{
    // in dem Objekt _List sind die Knotenwerte enthalten, die Kopiert werden
    // sollen. Kopiert wird in das Objekt "this"
    if (this == &_List)
        return *this; //  !! keine Aktion notwendig
    list_form = _List.list_form;
    Node* tmp_node;
    if (list_size)
    {
        Node* tmp_del;
        tmp_node = head_tail->next;
        while (tmp_node !=
            head_tail) // Alle eventuell vorhandenen Knoten in this löschen
        {
            tmp_del = tmp_node;
            tmp_node = tmp_node->next;
            delete tmp_del;
        }
        list_size = 0;
        head_tail->next = head_tail;
        head_tail->prev = head_tail;
    }
    tmp_node = _List.head_tail->next; // Die Listen-Knotenwerte werden kopiert
    while (tmp_node != _List.head_tail)
    {
        insertBack(tmp_node->value);
        tmp_node = tmp_node->next;
    }
    if (_List.temp)
        delete& _List; // ist die übergebene Liste eine temporäre Liste? -> aus
                       // Operator +
    return *this;
}

List& List::operator+(const List& List_Append)
{
    // Die Methode +
    // Es werden zwei Listen aneinander gehangen.
    // Dabei werden beide Ursprungslisten nicht verändert. Es entsteht eine neue
    // Ergebnisliste.
    Node* tmp_node;
    List* tmp;
    if (temp)
    { // this ist eine temporäre Liste und kann verändert werden
        tmp = this;
    }
    else
    {
        tmp =
            new List(*this); // this ist keine temporäre Liste -> Kopie erzeugen
        tmp->temp = true;    // Merker setzten, dass es sich um eine temporäre
                             // Liste handelt
    }
    if (List_Append.list_size)
    { // anhängen der übergebenen Liste an tmp
        tmp_node = List_Append.head_tail->next;
        while (tmp_node != List_Append.head_tail)
        {
            tmp->insertBack(tmp_node->value);
            tmp_node = tmp_node->next;
        }
    }
    if (List_Append.temp)
        delete& List_Append; // wurde eine temporäre Liste übergeben, dann wird
                             // diese gelöscht
    return *tmp;
}

void List::format(const std::string& start,
    const std::string& zwischen,
    const std::string& ende)
{
    // Setzen des Formates für die Ausgabesteuerung der Liste bei cout
    // das Format wird für den überladenen Operator << verwendet
    list_form.start = start;
    list_form.zwischen = zwischen;
    list_form.ende = ende;
}

std::ostream& operator<<(std::ostream& stream, List const& Liste)
{
    // Ausgabe der Liste mit cout
    stream << Liste.list_form.start;
    for (Node* tmp = Liste.head_tail->next; tmp != Liste.head_tail;
        tmp = tmp->next)
        stream << tmp->value
        << (tmp->next == Liste.head_tail ? Liste.list_form.ende :
            Liste.list_form.zwischen);
    if (Liste.temp)
        delete& Liste; // wurde eine temporäre Liste übergeben, dann wird diese
                       // gelöscht
    return stream;
}
