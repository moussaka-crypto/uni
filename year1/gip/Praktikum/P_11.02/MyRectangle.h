#pragma once

class MyRectangle {
protected: //Zugriff fuer Subklasse erlauben
	int x1, y1, x2, y2;
public:
	void setx1(int wert);
	void setx2(int wert);
	void sety1(int wert);
	void sety2(int wert);
	int getx1();
	int getx2();
	int gety1();
	int gety2();
	void setall(int wert1, int wert2, int wert3, int wert4);

	MyRectangle();
	MyRectangle(int wert1, int wert2, int wert3, int wert4);

	void draw();

	bool does_not_collide_with(const MyRectangle& other) const;
};
