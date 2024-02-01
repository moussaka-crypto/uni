#include <iostream>
#define CIMGGIP_MAIN
#include "CImgGIP06.h"
#include "MyRectangle.h"

int MyRectangle::get_LeftAngleX() const
{
	return x1;
}

int MyRectangle::get_LeftAngleY() const
{
	return y1;
}

int MyRectangle::get_RightAngleX() const
{
	return x2;
}

int MyRectangle::get_RightAngleY() const
{
	return y2;
}
///|||||||||||||||||||||||||||||||||||||||||||||||||
void MyRectangle::set_x1(int x1_copy)
{
	x1 = x1_copy;
}

void MyRectangle::set_y1(int y1_copy)
{
	y1 = y1_copy;
}

void MyRectangle::set_x2(int x2_copy)
{
	x2 = x2_copy;
}

void MyRectangle::set_y2(int y2_copy)
{
	y2 = y2_copy;
}

void MyRectangle::set(int x1_copy, int y1_copy, int x2_copy, int y2_copy)
{
	x1 = x1_copy;
	y1 = y1_copy;
	x2 = x2_copy;
	y2 = y2_copy;
}
///|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
MyRectangle::MyRectangle()
{
	x1 = 0; y1 = 0;
	x2 = 20; y2 = 20;
}

//MyRectangle::MyRectangle()
//{
//	x1 = 0; y1 = 0;
//	x2 = 0; y2 = 0;
//}

void MyRectangle::draw() const
{
	gip_draw_rectangle(x1, y1, x2, y2, blue);
}

bool MyRectangle::does_not_collide_with(const MyRectangle& other) const
{
	//if (this->x2 >= other.x1 &&     //Vergleich Kante This.Rechts und Other.Links
	//	this->x1 <= other.x2 &&     //Vergleich Kante This.Links und Other.Rechts
	//	this->y2 >= other.y1 &&     //Vergleich Kante This.Unten und Other.Oben
	//	this->y1 <= other.y2)       //Vergleich Kante This.Oben und Other.unten
	//	return false;
	//return true;

	if (this->x2 < other.x1 ||    //Vergleich Kante This.Rechts und Other.Links
		this->x1 > other.x2 ||     //Vergleich Kante This.Links und Other.Rechts
		this->y2 < other.y1 ||     //Vergleich Kante This.Unten und Other.Oben
		this->y1 > other.y2)       //Vergleich Kante This.Oben und Other.unten
		return true;
	return false; //besser?
}
