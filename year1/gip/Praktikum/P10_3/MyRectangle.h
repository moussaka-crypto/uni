#pragma once

//Alles innerhalb der Klasse sind Prototypen und Initialisierungen
//Rest in .cpp programmmieren
class MyRectangle
{
private:
	int x1, x2, y1, y2;

public:

	// Getter, wir wollen was zurückbekommen
	int getx1();
	int getx2();
	int gety1();
	int gety2();

	//Setter, wo wir schon was eingeben
	void setx1(int wert);
	void setx2(int wert);
	void sety1(int wert);
	void sety2(int wert);
	void setall(int wert1, int wert2, int wert3, int wert4);


	//Konstruktoren
	MyRectangle();
	MyRectangle(int wert1, int wert2, int wert3, int wert4) : x1{ wert1 }, y1{ wert2 }, x2{ wert3 }, y2{ wert4 } {} //Übernahme von 4 Parameter

	//Erweiterungen
	void draw() const;

	//10.2
	bool does_not_collide_with(const MyRectangle& other) const;
};

