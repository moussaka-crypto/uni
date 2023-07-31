#include "Helper.h"

void parse_gesamtausdruck(string& input, size_t& pos)
{
	cout << "Betrete parse_gesamtausdruck()" << endl;
	parse_ausdruck(input, pos);
	match('.', input, pos);
	cout << "Verlasse parse_gesamtausdruck()" << endl;
}
void parse_ausdruck(string& input, size_t& pos)
{
	cout << "Betrete parse_ausdruck()" << endl;
	parse_term(input, pos);
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

void parse_term(string& input, size_t& pos)
{
	cout << "Betrete parse_term()" << endl;
	parse_term(input, pos);
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

void parse_number(string& input, size_t& pos)
{
	cout << "Betrete parse_number()" << endl;
	for (char c = '0'; c <= '9'; c++)
	{
		if(expect(c, input, pos))
			match(c, input, pos);
	}
	cout << "Verlasse parse_number()" << endl;
}
