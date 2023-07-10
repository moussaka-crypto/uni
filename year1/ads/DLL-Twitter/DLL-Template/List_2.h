#pragma once
#include "Node_2.h"
#include <iostream>
#include <string>



template <class T>
class List
{
private:
    struct form
    {
        std::string start = "<< ";
        std::string zwischen = ", ";
        std::string ende = " >>\n";
    } list_form;
    Node<T>* head_tail; 
    int  list_size;  
    bool temp;

public:
    List();
    List(const List<T>& _List);
    ~List();
    void insertFront(T value);
    void insertFront(List<T>& _List);
    void insertBack(T value);
    void insertBack(List<T>& _List);
    bool getFront(T& value);
    bool getBack(T& value);
    bool del(T value);
    bool search(T value);
    bool swap(T value1, T value2);
    int  size(void);
    bool test(void);
    void format(const std::string& start, const std::string& zwischen, const std::string& ende);
    List<T>& operator=(const List<T>& _List);
    List<T>& operator+(const List<T>& List_Append);

    template <class Tf>
    friend std::ostream& operator << (std::ostream& stream, const List<Tf>& Liste);

};

template <class T> 
List<T>::List() {
    head_tail = new Node<T>;
    list_size = 0;
    temp = false;
    head_tail->next = head_tail;
    head_tail->prev = head_tail;
}

template <class T>
List<T>::List(const List<T>& _List) {

    list_form = _List.list_form;
    head_tail = new Node<T>;
    list_size = 0;
    temp = _List.temp;
    head_tail->next = head_tail;
    head_tail->prev = head_tail;
    Node<T>* tmp_node;
    tmp_node = _List.head_tail->next;
    while (tmp_node != _List.head_tail) //kopieren der Elemente von _List
    {
        head_tail->prev =
            new Node<T>(tmp_node->value, head_tail->prev->next, head_tail->prev);
        head_tail->prev->prev->next = head_tail->prev;
        list_size++;
        tmp_node = tmp_node->next;
    }

    if (_List.temp)
        delete& _List;
}

template <class T>
List<T>::~List() {

    while (head_tail->next != head_tail) {

        Node<T>* ptr = head_tail->next->next;
        delete head_tail->next;

        head_tail->next = ptr;
        ptr->prev = head_tail;
        list_size--;
    }
}

template <class T>
void List<T>::insertFront(T value) {
    Node<T>* neuer_eintrag = new Node<T>(value, head_tail, head_tail);
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

template <class T>
void List<T>::insertFront(List<T>& _List) {
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
} 

template <class T>
void List<T>::insertBack(T value) {
    Node<T>* neuer_eintrag = new Node<T>(value, head_tail, head_tail);
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

template <class T>
void List<T>::insertBack(List<T>& _List) {

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
}
template <class T>
bool List<T>::getFront(T& value) {
    if (!list_size || head_tail == head_tail->next) //leere Liste
        return false;
    else {
        Node<T>* terminator = head_tail->next;
        value = head_tail->next->value;

        terminator->prev->next = terminator->next;
        terminator->next->prev = terminator->prev;
        delete terminator;
        list_size--;

        return true;
    }
}

template <class T>
bool List<T>::getBack(T& value) {
    if (!list_size || head_tail == head_tail->next) //leere Liste
        return false;
    else {
        Node<T>* terminator = head_tail->prev;
        value = head_tail->prev->value;

        terminator->prev->next = terminator->next;
        terminator->next->prev = terminator->prev;
        delete terminator;
        list_size--;

        return true;
    }
}

template <class T>
bool List<T>::del(T value) {
    if (!list_size || head_tail == head_tail->next)
        return false;
    else {
        Node<T>* terminator = head_tail->next;
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
}

template <class T>
bool List<T>::search(T value) {
    if (!list_size || head_tail == head_tail->next)
        return false;
    else {
        Node<T>* seeker = head_tail->next;
        while (seeker != head_tail) {

            if (seeker->value == value) {
                return true;
            }

            seeker = seeker->next;
        }
        return false;
    }
}

template <class T>
bool List<T>::swap(T value1, T value2) {
    if (list_size < 2 || value1 == value2) //kein Sinn gleiche Werte zu tauschen
        return false;
    else {
        Node<T>* ptr1 = nullptr;
        Node<T>* ptr2 = nullptr;
        Node<T>* seeker = head_tail->next;
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
        //Nodes nebeneinander
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
        //Nodes nicht nebeneinander
        else {
            Node<T>* old_ptr1_p = ptr1->prev;
            Node<T>* old_ptr1_n = ptr1->next;

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
}

template <class T>
int  List<T>::size(void) { return list_size; }// Anzahl der Knoten

template <class T>
bool List<T>::test(void) {
    Node<T>* tmp = head_tail->next;
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
template <class T>
void List<T>::format(const std::string& start,
    const std::string& zwischen,
    const std::string& ende) {

    list_form.start = start;
    list_form.zwischen = zwischen;
    list_form.ende = ende;
}
// Mit der format-Methode kann die Ausgabe gesteuert werden: operator <<
// start: stirng vor der Ausgabe der Liste
// zwischen: string zwischen Listenknoten
// ende: string am Ende der Liste

template <class T>
List<T>& List<T>::operator=(const List<T>& _List) {

    if (this == &_List)
        return *this; //  !! keine Aktion notwendig
    list_form = _List.list_form;
    Node<T>* tmp_node;
    if (list_size)
    {
        Node<T>* tmp_del;
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

template <class T>
List<T>& List<T>::operator+(const List<T>& List_Append) {
    Node<T>* tmp_node;
    List<T>* tmp;
    if (temp)
    { // this ist eine temporäre Liste und kann verändert werden
        tmp = this;
    }
    else
    {
        tmp =
            new List<T>(*this); // this ist keine temporäre Liste -> Kopie erzeugen
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

template <class Tf> 
std::ostream& operator<<(std::ostream& stream, const List<Tf>& Liste) {
    stream << Liste.list_form.start;
    for (Node<Tf>* tmp = Liste.head_tail->next; tmp != Liste.head_tail;
        tmp = tmp->next)
        stream << tmp->value
        << (tmp->next == Liste.head_tail ? Liste.list_form.ende :
            Liste.list_form.zwischen);
    if (Liste.temp)
        delete& Liste; // wurde eine temporäre Liste übergeben, dann wird diese
                       // gelöscht
    return stream;
}