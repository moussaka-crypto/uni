#pragma once

template <class T>
class Node
{
public:
    T value;
    Node<T>* next, * prev;

public:
    Node();

    Node(T value, Node<T>* next = 0, Node<T>* prev = 0);

    ~Node();
};

template <class T>
Node<T>::Node() {
    next = 0;
    prev = 0;
}

template <class T>
Node<T>::Node(T value, Node<T>* next, Node<T>* prev) {
    this->value = value;
    this->next = next;
    this->prev = prev;
}

template <class T> Node<T>::~Node() {}

