#pragma once
#include <iostream>

class MyRectangle {
private:
	int x1, y1; //linke obere Ecke des Rechtecks |¯¯¯¯
	int x2, y2; //rechte untere Ecke des Rechtecks ___|

public:
	int get_x1() const;
	int get_y1() const;
	int get_x2() const;
	int get_y2() const;

	void set_x1(int x1_copy);
	void set_y1(int y1_copy);
	void set_x2(int x2_copy);
	void set_y2(int y2_copy);
	void set(int x1_copy, int y1_copy, int x2_copy, int y2_copy);

	MyRectangle();
	MyRectangle(int x1_copy, int y1_copy, int x2_copy, int y2_copy) : x1{ x1_copy }, y1{ y1_copy }, x2{ x2_copy }, y2{ y2_copy } {}

	void draw() const;
	bool does_not_collide_with(const MyRectangle& other) const;
};
