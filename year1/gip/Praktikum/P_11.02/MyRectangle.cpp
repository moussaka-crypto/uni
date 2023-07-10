#include "CImgGIP06.h"
#include <iostream>
#include"MyRectangle.h"

void MyRectangle::setx1(int wert) { x1 = wert; } // Setter
void MyRectangle::setx2(int wert) { x2 = wert; }
void MyRectangle::sety1(int wert) { y1 = wert; }
void MyRectangle::sety2(int wert) { y2 = wert; }
int MyRectangle::getx1() { return x1; } //Getter
int MyRectangle::getx2() { return x2; }
int MyRectangle::gety1() { return y1; }
int MyRectangle::gety2() { return y2; }

void MyRectangle::setall(int wert1, int wert2, int wert3, int wert4) { //Attribute gleichzeitig setzen
    x1 = wert1;
    y1 = wert2;
    x2 = wert3;
    y2 = wert4;
}
//Konstruktoren
MyRectangle::MyRectangle() {
    x1 = 0; y1 = 0;
    x2 = 20; y2 = 20;
}
MyRectangle::MyRectangle(int wert1, int wert2, int wert3, int wert4) {
    x1 = wert1; y1 = wert2;
    x2 = wert3; y2 = wert4;
}
//Methoden
void MyRectangle::draw() {
    gip_draw_rectangle(x1, y1, x2, y2, blue);
}

bool MyRectangle::does_not_collide_with(const MyRectangle& other) const {

    return (this->x2 < other.x1 ||		//Vergleich Kante This.Rechts und Other.Links
            this->x1 > other.x2 ||     //Vergleich Kante This.Links und Other.Rechts
            this->y2 < other.y1 ||     //Vergleich Kante This.Unten und Other.Oben
            this->y1 > other.y2);      //Vergleich Kante This.Oben und Other.unten
}
