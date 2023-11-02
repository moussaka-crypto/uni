#include "Raumschiff.h"
#include "ClmgGIP06.h"

void MyRectangle::draw_black() const { gip_draw_rectangle(x1, y1, x2, y2, black); }
void MyRectangle::draw_white() const { gip_draw_rectangle(x1, y1, x2, y2, white); }
void MyRectangle::draw_blue() const { gip_draw_rectangle(x1, y1, x2, y2, blue); }
void MyRectangle::draw_red() const { gip_draw_rectangle(x1, y1, x2, y2, red); }

bool MyRectangle::does_not_collide_with(const MyRectangle& other) const {
	return !(x1 > other.x2 || y1 > other.y2 || x2 < other.x1 || y2 < other.y1);
}