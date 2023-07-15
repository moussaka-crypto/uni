/*
Übung 2 - Aufgabe 2 (SS2021)
============================
Gegeben sei ein wohl geklammerter Ausdruck. Der Ausdruck enthält nur Integer-Zahlen.
Schreiben Sie ein C++ - Programm, das den Ausdruck berechnet und das Endergebnis 
auf der Konsole ausgibt. Es sollen nur die Grundrechenarten Addition, Subtraktion, 
Division und Multiplikation im Ausdruck vorkommen. 

Verwenden Sie dazu 2 Stapel aus der Standard Template Library(STL) :

	-	Operanden werden auf den Operanden - Stapel gelegt
	-	Operatoren werden auf den Operator - Stapel gelegt
	-	Linke Klammern werden im Ausdruck ignoriert
	-	Bei einer rechten Klammer werden 2 Operanden vom Operandenstapel entnommen 
	    und 1 Operator vom Operator - Stapel. Es wird der Ausdruck berechnet und 
		das Ergebnis wieder auf den Operandenstapel gelegt.

Beachten Sie: Zwischen den einzelnen Zeichen bzw. Ziffern befindet sich immer ein Leerzeichen im Ausdruck.

Skizzieren Sie die Zustände für beide Stapel für den folgenden Ausdruck:
( 1 + ( ( 2 + 3 ) * (4 * 5 ) ) )

Testen Sie auch ihr Programm mit diesem Ausdruck und geben das Endergebnis auf der Konsole aus.
Testen Sie auch die folgenden Ausdrücke :
( ( ( 5 – 2 ) * ( ( 10 + 20 ) – 30 ) ) + 100 )
( ( ( 3 + 4 ) * ( 10 - 5 ) ) * ( 4 + 7 ) ) 

*/
#include <iostream>
#include <string>
#include <sstream>
#include <stack>
#include <vector>
using namespace std;

int main()
{
//	string str("( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )"); // = 101
	string str("( ( ( 5 - 2 ) * ( ( ( 11 + 20 ) - 30 ) ) + 100 )"); // = 103
//	string str("( ( ( 3 + 4 ) * ( 10 - 5 ) ) * ( 4 + 7 ) )"); // = 385
	string tmp;
	stringstream str_strm(str);  
	stack<double> operandStack;  // Stack 1 für Operanden
	stack<string> operatorStack; // Stack 2 für Operatoren
	double erg = 0.0; // speichert temporäres Ergebnis

	// String in einzelne Wörter zerlegen
	vector<string> words;
	while (str_strm >> tmp) {
		// ToDo: lege nächstes Zeichen bzw. Wort in den Vektor mit push_back
		// cout << tmp << endl;
	}

	cout << "Berechne Ausdruck" << endl;
	// Einzelne Wörter abarbeiten
	for (int i = 0; i < words.size(); i++) {
		cout << words[i] << " ";
		// Verarbeite die Strings nach der Aufgabenstellung

		if (words[i].compare("(") == 0) {
			// überlese Klammer auf
			cout << "Klammer auf ueberlesen" << endl;
			// nix tun
		}
		else if (words[i].compare("+-*/") == 0) {
			cout << "Operatorzeichen";
		}
		else if (words[i].compare("+") == 0) {
			// Addition ausführen
			cout << "Addition:";
			// ToDo + auf den Operatorstapel legen
			
		}
		else if (words[i].compare("-") == 0) {
			// Subtraktion ausführen
			cout << "Subtraktion:";
			// TODO: - auf den Operatorstapel legen
		}
		else if (words[i].compare("*") == 0) {
			// Multiplikation ausführen
			cout << "Multiplikation:";
			// ToDo * auf den Operatorstapel legen
		}
		else if (words[i].compare("/") == 0) {
			// Division ausführen
			cout << "Division:";
			// TODO / auf den Operatorstapel legen
		}
		else if (words[i].compare(")") == 0) {
			// Klammer zu erkannt
			cout << "Klammer zu erkannt - Operation ausfuehren nach Aufgabenstellung";
			// TODO 1: hole 2 Zahlen aus den Operandenstapel
			// TODO 2: lösche diese jeweils vom Stapel

			string opsign = // TODO 3: hole den Operator aus Operatorstapel
			// TODO 4: lösche diesen vom Stapel
			
			// Operation ausführen
			if (opsign.compare("+") == 0) {
				erg = op1 + op2;
			}
			else if (opsign.compare("-") == 0) {
				erg = op1 - op2;
			}
			else if (opsign.compare("*") == 0) {
				erg = op1 * op2;
			}
			else if (opsign.compare("/") == 0) {
				erg = op1 / op2;
			}
			// TODO 5: Ergebnis wieder auf den Operanden-Stapel legen
		}
		else {
			// Überprüfe ob String ein Integer ist
			cout << "Zahl?";
			string::size_type sz;
			double number = stod(words[i], &sz);
			cout << " " << number << " erkannt";
			operandStack.push(number);
		}
		cout << endl;		
	}
	// Ergebnis ausgeben:
	// TODO: Wert "erg" vom Stapel holen
	// TODO: Wert "erg" vom Stapel löschen und "erg" ausgeben

	cout << "Ausdruck: " << str << " = " << erg << endl;
	
	return 0;
}