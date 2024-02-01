#pragma once
#include <iostream>
#include <string>
using std::cin;
using std::cout;
using std::endl;
using std::string;

//void parse_gesamtausdruck(string& input, size_t& pos);
//void parse_ausdruck(string& input, size_t& pos);
//void parse_term(string& input, size_t& pos);
//void parse_operand(string& input, size_t& pos);
//void parse_number(string& input, size_t& pos);

bool expect(char c, string& input, size_t pos)
{
	cout << "Teste auf das Zeichen " << c << endl;
	if (pos >= input.length())
	{
		cout << "Aber schon am Ende der "
			<< "Eingabe-Zeichenkette angelangt.\n";
		return false;
	}
	else if (input.at(pos) == c)
	{
		cout << "Zeichen " << c << " gefunden.\n";
		return true;
	}
	else
	{
		cout << "Test auf " << c << " nicht erfolgreich. "
			<< "Stattdessen " << input.at(pos)
			<< " gesehen." << endl;
		return false;
	}
}

void match(char c, string& input, size_t& pos)
{
	cout << "Betrete match() fuer das Zeichen " << c << endl;
	if (pos >= input.length())
	{
		cout << "Input-Zeichenkette zu kurz. "
			<< "Erwarte noch das Zeichen " << c << endl;
		cout << "Verlasse match(): " << endl;
		return;
	}
	else if (input.at(pos) != c)
	{
		cout << "Fehler: an Position "
			<< pos << " erwarte "
			<< c << " und sehe " << input.at(pos) << endl;
		cout << "Verlasse match(): " << endl;
		return;
	}
	pos++;
	cout << "Zeichen " << c << " konsumiert.\n"
		<< "Verlasse match() fuer das Zeichen "
		<< c << endl;
}

void parse_number(string& input, size_t& pos)
{
	cout << "Betrete parse_number()" << endl;
	for (char c = '0'; c <= '9'; c++)
	{
		if (expect(c, input, pos))
			match(c, input, pos);
	}
	cout << "Verlasse parse_number()" << endl;
}

void parse_ausdruck(string& input, size_t& pos)
{
	cout << "Betrete parse_ausdruck()" << endl;
	parse_term(input, pos);
	// bool array spaeter
	while (expect('U', input, pos) || expect('O', input, pos)) {

		if (expect('U', input, pos))
		{
			cout << "Betrete parse_ausdruck(): 'U' Fall" << endl;
			match('U', input, pos);
			parse_term(input, pos);
			cout << "Verlasse parse_ausdruck(): 'U' Fall" << endl;
		}
		else if (expect('O', input, pos))
		{
			cout << "Betrete parse_ausdruck(): 'O' Fall" << endl;
			match('O', input, pos);
			parse_term(input, pos);
			cout << "Verlasse parse_ausdruck(): 'O' Fall" << endl;
		}
	}
	cout << "Verlasse parse_ausdruck()" << endl;
}

void parse_operand(string& input, size_t& pos)
{
	cout << "Betrete parse_operand()" << endl;
	if (expect('(', input, pos))
	{
		cout << "Betrete parse_operand(): '(' Fall" << endl;
		match('(', input, pos);
		parse_ausdruck(input, pos);
		match(')', input, pos);
		cout << "Verlasse parse_operand(): '(' Fall" << endl;
		cout << "Verlasse parse_operand()" << endl;
	}
	else {
		parse_number(input, pos);
		cout << "Verlasse parse_operand()" << endl;
	}
}

void parse_term(string& input, size_t& pos)
{
	cout << "Betrete parse_term()" << endl;
	parse_term(input, pos);
	// bool array spaeter
	while (expect('>', input, pos) || expect('<', input, pos)) {

		if (expect('>', input, pos))
		{
			cout << "Betrete parse_term(): '>' Fall" << endl;
			match('>', input, pos);
			parse_operand(input, pos);
			cout << "Verlasse parse_term(): '>' Fall" << endl;
		}
		else if (expect('<', input, pos))
		{
			cout << "Betrete parse_term(): '<' Fall" << endl;
			match('<', input, pos);
			parse_operand(input, pos);
			cout << "Verlasse parse_term(): '<' Fall" << endl;
		}
	}
	cout << "Verlasse parse_term()" << endl;
}

void parse_gesamtausdruck(string& input, size_t& pos)
{
	cout << "Betrete parse_gesamtausdruck()" << endl;
	parse_ausdruck(input, pos);
	match('.', input, pos);
	cout << "Verlasse parse_gesamtausdruck()" << endl;
}