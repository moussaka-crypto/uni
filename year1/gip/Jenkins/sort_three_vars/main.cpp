#include <iostream>
#include <string>
using namespace std;

#include "sort_three_vars.h"

int main() {
	int x1 = 0, x2 = 0, x3 = 0;
	string text1 = "", text2 = "", text3 = "";
	//INTEGER SWAP
	cout << "Bitte geben Sie die erste int Zahl ein: ? ";
	cin >> x1;
	cin.ignore();
	cout << "Bitte geben Sie die zweite int Zahl ein: ? ";
	cin >> x2;
	cin.ignore();
	cout << "Bitte geben Sie die dritte int Zahl ein: ? ";
	cin >> x3;
	cin.ignore();
	sort_three_vars<int>(x1, x2, x3);
	cout << "Erste Zahl nachher: " << x1 << endl;
	cout << "Zweite Zahl nachher: " << x2 << endl;
	cout << "Dritte Zahl nachher: " << x3 << endl;

	//STRING SWAP
	cout << "Bitte geben Sie den ersten String ein: ? ";
	getline(cin, text1);
	cout << "Bitte geben Sie den zweiten String ein: ? ";
	getline(cin, text2);
	cout << "Bitte geben Sie den dritten String ein: ? ";
	getline(cin, text3);
	sort_three_vars<string>(text1, text2, text3);
	cout << "Erster String nachher: " << text1 << endl;
	cout << "Zweiter String nachher: " << text2 << endl;
	cout << "Dritter String nachher: " << text3 << endl;
}