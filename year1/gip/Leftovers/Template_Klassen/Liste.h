#pragma once
template <typename T> class TListenKnoten {
public:
	//Attribute
	T data;
	TListenKnoten<T>* next;
	//Konstruktor
	TListenKnoten(T d) : data(d), next{ nullptr } {}
};

template <typename T> class Liste {
private:
	TListenKnoten<T>* anker = nullptr;
public:
	void hinten_anfuegen(T data);
	void liste_ausgeben() const;
};