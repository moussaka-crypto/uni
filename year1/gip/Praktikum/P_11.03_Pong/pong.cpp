// Datei: pong.cpp

#define CIMGGIP_MAIN
#include "CImgGIP06.h"
using namespace std;

int main()
{
	// Für das "blaue Spielfeld" ...
	const unsigned int x0 = 100, y0 = 100;
	const unsigned int x1 = 500, y1 = 500;

	// Für Position und Ausdehnung des weißen Balls ...
	int xb = 200, yb = 300;
	const int ball_size = 10;

	// Geschwindigkeit des Balls ...
	int delta_x = -3, delta_y = -3;

	// Ausdehnung und Position des Schlaegers ...
	const int schlaeger_size_x = 50, schlaeger_size_y = 20;
	int xs = 300, ys = y1 - schlaeger_size_y;


	gip_white_background();
	while (gip_window_not_closed())
	{
		// Später nötig, damit die Graphik "schneller" wird …
		gip_stop_updates();

		// 1.1. Blaues "Spielfeld" neu zeichnen ...
		gip_draw_rectangle(x0, y0, x1, y1, black);

		// 1.2. Ball zeichnen ...
		gip_draw_rectangle(xb + 18 * ball_size, yb, xb + 19 * ball_size, yb + ball_size, white); //ok

		// 1.3. Ball bewegen
		xb += delta_x;
		yb += delta_y;
	
		//Ball-Kollisionen mit dem Rand ...

		/*2.1. Kollision mir oberer Wand*/
		if (yb <= y0 || 
		/*7. Kollision mit Schlaeger irgendwo*/
		yb + ball_size > ys && gip_mouse_x() <= xb + 19 * ball_size && gip_mouse_x() + schlaeger_size_x >= xb + 18 * ball_size)

		{ /*2.2. y-Bewegungsrichtung umkehren*/
			delta_y *= -1;
		}

		if (xb + 18 * ball_size < x0 /* 3. links*/ || xb + 19 * ball_size > x1 /* 4. rechts*/)
		{ /*3.1 und 4.1 x-Bewegungsrichtung umkehren*/
			delta_x *= -1;	
		}

		// Unterer Rand erreicht => Abbruch
		if (yb + ball_size >= y1) { break; }

		// Schlaeger zeichnen und bewegen ...
		gip_draw_rectangle(gip_mouse_x(), ys, gip_mouse_x() + schlaeger_size_x, ys + schlaeger_size_y, white);

		// Falls der Schläger außerhalb des Spielfelds => zurücksetzen ... hard reset variante
		if (gip_mouse_x()+schlaeger_size_x < x0 || gip_mouse_x() > x1) 
		{
			gip_draw_rectangle(xs, ys, xs + schlaeger_size_x, ys + schlaeger_size_y, white); //hard reset
		} //schläger zurücksetzen
		

		// Später nötig, damit die Graphik "schneller" wird …
		gip_start_updates();

		// Später nötig, wenn die Graphik "auf schneller gestellt" ist:
		// Etwas Pause, damit das Spiel nicht zu schnell läuft ...
		gip_wait(20);
	}
	return 0;
}
