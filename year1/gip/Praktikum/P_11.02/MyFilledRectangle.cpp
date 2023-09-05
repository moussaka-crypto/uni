#include "MyRectangle.h"
#include "MyFilledRectangle.h"
#include "CImgGIP06.h"

void MyFilledRectangle::draw()
{
	MyRectangle::draw(); //blaues Rechteck zuerst

	if (x2 - x1 > 4 && y2 - y1 > 4) // wenn Abstand groesser als 4 pixel (2 pro Punkt) an allen vier Rändern - nur dann ausfuellen!
		for (int ausf = 2; y1 + ausf <= y2 - 2; ausf++)
		{
			gip_draw_line(x1 + 2, y1 + ausf, x2 - 2, y1 + ausf, blue); //zeile wird auf das gleiche Niveau ausgegeben
		}
}