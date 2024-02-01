#pragma once
#include <string>
#include <iostream>

const int screen_width = 1024;
const int screen_height = 768;

class Raumschiff {
private:
	int x, y;

public:
	std::string name;

	int get_x() const { return x; }
	int get_y() const { return y; }

	void set_x(int x_p) { x = x_p; }
	void set_y(int y_p) { y = y_p; }

	//keine Parameter im Standard Konstruktor
	Raumschiff() : name{ std::string("(nicht gesetzt)") }, x{ 0 }, y{ 0 } {}

	void get_coordinates(int& x1, int& y1) const {
		x1 = get_x();
		y1 = get_y();
	}

	bool set_coordinates(int x1, int y1) {

		if (0 <= x1 < screen_width && 0 <= y1 < screen_height) {
			set_x(x1);
			set_y(y1);
			return true;
		}
		//Position beibehalten == nix tun
		std::cout << "Ausserhalb des Bildschirms!" << std::endl;
		return false;
	}
};