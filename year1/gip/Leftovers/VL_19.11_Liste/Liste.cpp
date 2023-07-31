#include <iostream>
#include <string>
using namespace std;

//struct TListenKnoten  // Datenstruktur mit int Wert und Pfeil, der auf das naechste Kaestchen zeigt
//{
//	int data;
//	TListenKnoten *next; // Datentyp wird bei seiner Definition in sich selbst verwendet
//};
//
//void vorne_anfuegen(TListenKnoten*& anker, int wert)
//{
//	//TListenKnoten* neuer_eintrag = new TListenKnoten; - keine glob. Var mehr mit Referenzparameter
//
//
//	// Leere Liste 
//	if (anker == nullptr)
//	{
//	
//		TListenKnoten* neuer_eintrag/*oder nur anker*/ = new TListenKnoten;
//		
//		anker = neuer_eintrag; // unnoetig wenn anker = new TListenKnoten;
//		anker->next = nullptr; //denn neuer_eintrag == anker, d.h. sie zeigen auf den gleichen Knoten
//		anker->data = wert;
//
//		//am besten --- anker = new TListenKnoten {wert, nullptr}; alles in nur ein Schritt statt 5 oder 3 Schr.
//	}
//	
//	// nicht Leere Liste (anker != nullptr)
//	else
//	{
//		TListenKnoten* neuer_eintrag = new TListenKnoten;
//
//		neuer_eintrag->next = anker;
//		anker = neuer_eintrag;
//		anker->data = wert;
//
//		// am besten --- anker = new ListenKnoten{wert, anker}; //alles in nur 1 Schr.
//
//		//anker = neuer_eintrag->next->next->next;   wenn anker zuerst auf den dritten Knoten zeigt - hypothetisch?
//		//anker = anker->next->next;
//	}
//}
//
//void hinten_anfuegen(TListenKnoten*& anker, int wert)
//{
//	TListenKnoten* neuer_eintrag = new TListenKnoten;
//
//	neuer_eintrag->data = wert;
//	neuer_eintrag->next = nullptr;
//	
//	if (anker == nullptr) // dies ist der erste Eintrag in der Liste
//		anker = neuer_eintrag;
//
//	else // (anker != nullptr) d.h. dies ist nicht der erste Eintrag in der Liste
//	{
//		TListenKnoten* ptr = anker;
//
//		while (ptr->next != nullptr) // laufe durch die Liste bis zum letzten Eintrag
//			ptr = ptr->next;
//
//		//----------------------------------------------------------// hier sind wir am Ende der Liste (nach der Schleife)
//		
//		ptr->next = neuer_eintrag; // neuer Eintrag wird am Ende der Liste angegeben
//	}
//}
//
//void liste_ausgeben(TListenKnoten*& anker, int wert)
//{
//	if (anker == nullptr)
//		cout << "/////Leere Liste./////" << endl;
//
//	else
//	{ // Liste nicht leer
//		cout << "[ ";
//		
//		TListenKnoten* ptr = anker; // Initialisieren des Arbeitspointers ( merkt, wo wir uns in der Liste befinden )
//
//		do // traversieren durch Schleife
//		{
//			cout << ptr->data; // aktueller Knoten ausgeben
//
//			if (ptr->next != nullptr) // d.h. es gibt einen Nachfolger in der Liste
//				cout << " , ";
//
//			else cout << " "; // nix
//
//			ptr = ptr->next; // Pfeil auf naechstes Element ( Pfeil wird kopiert )
//
//		} while (ptr != nullptr); // Schleife wiederholt sich, bis das Ende der Liste erreicht ist
//		
//		cout << "]" << endl;
//	}
//}

//std::string reverse(std::string str) {
//	std::string s = "";
//	for (int i = str.length()-1; i <= str.length(); i--) {
//		s += str[i];
//	}
//	return s;
//}

//void reverse(char* str) {
//	if (*str == '\0')
//		return;
//	else {
//		reverse(str + 1);
//		cout << *str;
//	}
//}

//int r = 32, q = 70;

//char c = 'm';
//template <typename num>
//num f(double p1, double p2) {
//	num i = p1 + p2;
//	c++;
//	//Pos 1
//	return i;
//}


//int g1 = 5;
//int g2 = 2;

//int f(int& b) {
//
//	int p = 0;
//	while (p < 5)
//	{
//		b++;
//		p++;
//		g1++;
//	}
//	return b;
//}

//bool isPal(const string& str, int s, int e) {
//	if (s >= e) return true;
//	if (str[s] != str[e]) return false;
//	return isPal(str, ++s, --e);
//}

int main()
{
	//char str[] = "Hello";
	//reverse(str);

	//int a = 2;
	//for (int i = 0; i < 5; i++) {
	//	int b = 2;
	//	r++; q--;
	//	a += 3;
	//	// Pos 1 im Stack bei zweitem Durchlauf
	//	b += 12;
	//	if (i == 3) break;
	//	//Pos 2 im Stack bei drittem Durchlauf
	//	cout << "a: " << a << '\n';
	//	a--, b++;
	//	cout << "b: " << b <<'\n';
	//}
	//int c = 1, d = 7*c-1;
	////Pos 3 im Stack
	//cout << "a: " << a << '\n';
	//cout << "c: " << c << '\n';
	//cout << "d: " << d << '\n';

	//double d1 = 9.3, d2 = 1.7;
	//for (int j = 0; j < 3; j++)
	//{
	//	//Pos 2 zweiten durchlauf
	//	c++;
	//}
	//int i = f<int>(d1, d2);
	////Pos 3

	////AB von main
	//int a = 3;

	//for (int i = 0; i < 4; i++)//AB von for-Schleife
	//{
	//	//AB innerhalb der Schleife
	//	int ze = 8;
	//	a += 4;
	//	ze += 5;
	//	//Schleife wurde 4 mal ausgeführt - Stand hier zeichnen
	//}

	//g2 += 2;
	//int hi = 1;
	//f(hi);
	//int c = 8;
	////Stand hier zeichnen

	int a = 0, b[4] = { 4,2,6,8 }, * p = b;
	for (int i = 3, c = b[i]; b[i] != 2; i--, c = b[i]) {
		a = *p++ + --c;
	}
	a = a * b[0];


	system("pause");
	return 0;

}