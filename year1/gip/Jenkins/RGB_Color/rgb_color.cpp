#include "RGB_Color.h"
#include <iostream>
using namespace std;

void RGB_Color::set_color(int r, int g, int b) {
	set_red(r);
	set_green(g);
	set_blue(b);
}

void RGB_Color::display() {
	cout << "Red: " << get_red() << " Green: " << get_green() << " Blue: " << get_blue() << '\n';
}

bool RGB_Color::input_color() {

	int r, gr, bl;

	cout << "rot (0...255): ? "; cin >> r;
	if ( r < 0 || r > 255 ) { return false; }

	cout << "gruen (0...255): ? "; cin >> gr;
	if (gr < 0 || gr > 255) { return false; }

	cout << "blau (0...255): ? "; cin >> bl;
	if (bl < 0 || bl > 255) { return false; }

	set_color(r, gr, bl);
}
