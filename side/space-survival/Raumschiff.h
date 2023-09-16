#pragma once
class MyRectangle {
private:
	int x1, y1, x2, y2;

public:
	//Konstruktor
	MyRectangle(int wert_x1, int wert_y1, int wert_x2, int wert_y2) : x1{ wert_x1 }, y1{ wert_y1 }, x2{ wert_x2 }, y2{ wert_y2 }{}

	//setter
	void set_x1(int x_1) { x1 = x_1; }
	void set_y1(int y_1) { y1 = y_1; }
	void set_x2(int x_2) { x2 = x_2; }
	void set_y2(int y_2) { y2 = y_2; }

	//getter
	int get_x1() const { return x1; }
	int get_y1() const { return y1; }
	int get_x2() const { return x2; }
	int get_y2() const { return y2; }

	//Zeichnen
	void draw_black() const;
	void draw_white() const;
	void draw_blue() const;
	void draw_red() const;
	//Kollisionsabfrage
	bool does_not_collide_with(const MyRectangle& other) const;
};