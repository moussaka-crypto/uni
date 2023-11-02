#define CIMGGIP_MAIN
#include "ClmgGIP06.h"
#include "Raumschiff.h"
using namespace std;


int main()
{
	const unsigned int x = 50, y = 50;
	const unsigned int x0 = 550, y0 = 550;
	const int v = 5;

	int delta_x = 0, delta_y = 3;

	const int ship_size_x = 50, ship_size_y = 20;
	int xs = 300, ys = y0 - ship_size_y;
	const unsigned int ship_speed = 4;

	gip_white_background();
	MyRectangle top(x, y, x0, y);
	MyRectangle bottom(x, y0, x0, y0);
	MyRectangle left(x, y, x, y0);
	MyRectangle right(x0, y, x0, y0);
	
	int ya = 60, ya2 = -150;
	const int asteroid_size = 30;
	int xa1 = gip_random(x, x0), xa2 = gip_random(x, x0), xa3 = gip_random(x, x0), xa4 = gip_random(x, x0), xa5 = gip_random(x, x0),
		xa6 = gip_random(x, x0), xa7 = gip_random(x, x0), xa8 = gip_random(x, x0), xa9 = gip_random(x, x0), xa10 = gip_random(x, x0);


	while (gip_window_not_closed())
	{
		gip_stop_updates();

		MyRectangle field(x, y, x0, y0);
		field.draw_black();
		
		MyRectangle asteroid1(xa1, ya, (xa1 + asteroid_size), (ya + asteroid_size));
		MyRectangle asteroid2(xa2, ya, (xa2 + asteroid_size), (ya + asteroid_size));
		MyRectangle asteroid3(xa3, ya, (xa3 + asteroid_size), (ya + asteroid_size));
		MyRectangle asteroid4(xa4, ya, (xa4 + asteroid_size), (ya + asteroid_size));
		MyRectangle asteroid5(xa5, ya, (xa5 + asteroid_size), (ya + asteroid_size));
		asteroid1.draw_white();
		asteroid2.draw_white();
		asteroid3.draw_white();
		asteroid4.draw_white();
		asteroid5.draw_white();

		
		MyRectangle asteroid6(xa6, ya2, (xa6 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid7(xa7, ya2, (xa7 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid8(xa8, ya2, (xa8 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid9(xa9, ya2, (xa9 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid10(xa10, ya2, (xa10 + asteroid_size), (ya2 + asteroid_size));
		asteroid6.draw_white();
		asteroid7.draw_white();
		asteroid8.draw_white();
		asteroid9.draw_white();
		asteroid10.draw_white();

		MyRectangle Ship(xs, ys, (xs + ship_size_x), (ys + ship_size_y));
		Ship.draw_blue();

		int mouse_x = gip_mouse_x();
		int ship_mid = (xs + 0.5 * ship_size_x);
		if (ship_mid < mouse_x && (xs + ship_size_x) < x0)
			xs += ship_speed;
		else if (ship_mid > mouse_x && xs > x)
			xs -= ship_speed;

		if (asteroid1.does_not_collide_with(bottom))
		{
			xa1 = gip_random(x, x0), ya = 60;
			MyRectangle asteroid1(xa1, ya, (xa1 + asteroid_size), (ya + asteroid_size));
			xa2 = gip_random(x, x0);
			MyRectangle asteroid2(xa2, ya, (xa2 + asteroid_size), (ya + asteroid_size));
			xa3 = gip_random(x, x0);
			MyRectangle asteroid3(xa3, ya, (xa3 + asteroid_size), (ya + asteroid_size));
			xa4 = gip_random(x, x0);
			MyRectangle asteroid4(xa4, ya, (xa4 + asteroid_size), (ya + asteroid_size));
			xa5 = gip_random(x, x0);
			MyRectangle asteroid5(xa5, ya, (xa5 + asteroid_size), (ya + asteroid_size));
		}
		ya += delta_y;

		if (asteroid10.does_not_collide_with(bottom)) {
			ya2 = 60;
		
		MyRectangle asteroid6(xa6, ya2, (xa6 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid7(xa7, ya2, (xa7 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid8(xa8, ya2, (xa8 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid9(xa9, ya2, (xa9 + asteroid_size), (ya2 + asteroid_size));
		MyRectangle asteroid10(xa10, ya2, (xa10 + asteroid_size), (ya2 + asteroid_size));
		}
		ya2 += delta_y;

		if (Ship.does_not_collide_with(asteroid1) || Ship.does_not_collide_with(asteroid2) || Ship.does_not_collide_with(asteroid3) || Ship.does_not_collide_with(asteroid4) || Ship.does_not_collide_with(asteroid5) ||
			Ship.does_not_collide_with(asteroid6) || Ship.does_not_collide_with(asteroid7) || Ship.does_not_collide_with(asteroid8) || Ship.does_not_collide_with(asteroid9)|| Ship.does_not_collide_with(asteroid10))
		{
			gip_load_image("boom.bmp");
			gip_draw_text(100, 100, "You Suck!");
			gip_sleep(2);
			break;
		}

		gip_start_updates();
		gip_wait(v);
	}
	return 0;
}