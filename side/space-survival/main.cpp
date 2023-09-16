#define CIMGGIP_MAIN
#include "ClmgGIP06.h"
#include "Raumschiff.h"
using namespace std;


int main()
{
	// F¸r das "schwarze Spielfeld" ...
	const unsigned int x = 50, y = 50;
	const unsigned int x0 = 550, y0 = 550;

	// Geschwindigkeit Spiel
	const int v = 5;

	// Geschwindigkeit der Asteroiden ...
	int delta_x = 0, delta_y = 3;


	// Ausdehnung und Position des Schiffs ...
	const int Schiff_groeﬂe_x = 50, Schiff_groeﬂe_y = 20;
	int xs = 300, ys = y0 - Schiff_groeﬂe_y;
	// Schiff Geschwindigkeit
	const unsigned int Schiff_geschwindigkeit = 4;

	gip_white_background();
	MyRectangle rand_oben(x, y, x0, y);
	MyRectangle rand_unten(x, y0, x0, y0);
	MyRectangle rand_links(x, y, x, y0);
	MyRectangle rand_rechts(x0, y, x0, y0);
	

	// Asteroid startposition
	int ya = 60, ya2 = -150;
	const int asteroid_groeﬂe = 30;
	int xa1 = gip_random(x, x0), xa2 = gip_random(x, x0), xa3 = gip_random(x, x0), xa4 = gip_random(x, x0), xa5 = gip_random(x, x0),
		xa6 = gip_random(x, x0), xa7 = gip_random(x, x0), xa8 = gip_random(x, x0), xa9 = gip_random(x, x0), xa10 = gip_random(x, x0);


	while (gip_window_not_closed())
	{
		gip_stop_updates();

		// Weltraum zeichnen
		MyRectangle field(x, y, x0, y0);
		field.draw_black();
		

		//Asteroiden
		MyRectangle asteroid1(xa1, ya, (xa1 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		MyRectangle asteroid2(xa2, ya, (xa2 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		MyRectangle asteroid3(xa3, ya, (xa3 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		MyRectangle asteroid4(xa4, ya, (xa4 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		MyRectangle asteroid5(xa5, ya, (xa5 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		asteroid1.draw_white();
		asteroid2.draw_white();
		asteroid3.draw_white();
		asteroid4.draw_white();
		asteroid5.draw_white();

		
		MyRectangle asteroid6(xa6, ya2, (xa6 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid7(xa7, ya2, (xa7 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid8(xa8, ya2, (xa8 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid9(xa9, ya2, (xa9 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid10(xa10, ya2, (xa10 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		asteroid6.draw_white();
		asteroid7.draw_white();
		asteroid8.draw_white();
		asteroid9.draw_white();
		asteroid10.draw_white();


		//Schiff Zeichnen
		MyRectangle Schiff(xs, ys, (xs + Schiff_groeﬂe_x), (ys + Schiff_groeﬂe_y));
		Schiff.draw_blue();

		// Schiff steuern ...
		int mouse_x = gip_mouse_x();
		int schiff_mitte = (xs + 0.5 * Schiff_groeﬂe_x);
		if (schiff_mitte < mouse_x && (xs + Schiff_groeﬂe_x) < x0)
			xs += Schiff_geschwindigkeit;
		else if (schiff_mitte > mouse_x && xs > x)
			xs -= Schiff_geschwindigkeit;


		// Asteroiden Umflogen? Neue Asteroiden
		if (asteroid1.does_not_collide_with(rand_unten))
		{
			// F¸r Position und Ausdehnung des Asteroiden ...
			xa1 = gip_random(x, x0), ya = 60;
			MyRectangle asteroid1(xa1, ya, (xa1 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
			xa2 = gip_random(x, x0);
			MyRectangle asteroid2(xa2, ya, (xa2 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
			xa3 = gip_random(x, x0);
			MyRectangle asteroid3(xa3, ya, (xa3 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
			xa4 = gip_random(x, x0);
			MyRectangle asteroid4(xa4, ya, (xa4 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
			xa5 = gip_random(x, x0);
			MyRectangle asteroid5(xa5, ya, (xa5 + asteroid_groeﬂe), (ya + asteroid_groeﬂe));
		}
		ya += delta_y;

		if (asteroid10.does_not_collide_with(rand_unten)) {
			ya2 = 60;
		
		MyRectangle asteroid6(xa6, ya2, (xa6 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid7(xa7, ya2, (xa7 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid8(xa8, ya2, (xa8 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid9(xa9, ya2, (xa9 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		MyRectangle asteroid10(xa10, ya2, (xa10 + asteroid_groeﬂe), (ya2 + asteroid_groeﬂe));
		}
		ya2 += delta_y;


		// Kollision Schiff Asteroiden
		if (Schiff.does_not_collide_with(asteroid1) || Schiff.does_not_collide_with(asteroid2) || Schiff.does_not_collide_with(asteroid3) || Schiff.does_not_collide_with(asteroid4) || Schiff.does_not_collide_with(asteroid5) ||
			Schiff.does_not_collide_with(asteroid6) || Schiff.does_not_collide_with(asteroid7) || Schiff.does_not_collide_with(asteroid8) || Schiff.does_not_collide_with(asteroid9)|| Schiff.does_not_collide_with(asteroid10))
		{
			gip_load_image("explosion.bmp");
			gip_draw_text(100, 100, "You Suck!");
			gip_sleep(2);
			break;
		}

		gip_start_updates();
		gip_wait(v);
	}
	return 0;
}