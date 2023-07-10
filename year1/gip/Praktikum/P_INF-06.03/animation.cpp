#include <iostream>
#define CIMGGIP_MAIN
#include "CImgGIP05.h"
using namespace std;

int main()
{
	// Für das "blaue Spielfeld" ...
	const int left_border = 100;
	const int right_border = 500;

	// Für Ausdehnung und Position des weißen Quadrats ...
	int x = 200, y = 300;
	const int rectangle_size = 50; //size in pixels 
	int delta = 10;

	//int direction = 1; //positiv wenn nach rechts, negativ wenn nach links

	gip_white_background();

	while (gip_window_not_closed())
	{
		// Blaues "Spielfeld" neu zeichnen
		// (übermalt dann auch das letzte weiße Quadrat) ...
		gip_draw_rectangle(left_border, 100, // linke obere Ecke
			right_border, 500, // rechte untere Ecke
			blue);

		// Weißes Quadrat neu zeichnen an der Position x,y ...
		gip_draw_rectangle(x, y, // linke obere Ecke
			x + rectangle_size, // rechte untere Ecke
			y + rectangle_size,
			white);
		// Nächste Position des weißen Quadrats berechnen.
		// Dabei berücksichtigen, dass das Quadrat von den Rändern des
		// blauen "Spielfelds" abprallen muss ...
		/* Ihr Code zur Berechnung der neuen Werte von x und y hier */

		if (x == right_border - rectangle_size || x == left_border) //wenn das Quadrat an der jeweilige Grenze liegt
		{
			delta *= -1;
		}

		x += delta; // x wird hier verkleinert oder vergroessert, haengt vom direction ab

		gip_wait(100); //intervall in ms, wie schnell sich das Quadrat bewegt???
	}
	return 0;
}