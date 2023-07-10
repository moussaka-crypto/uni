#pragma once
const unsigned char white[] = { 255, 255, 255 };
const unsigned char black[] = { 0, 0, 0 };
const unsigned char red[] = { 255, 0, 0 };
const unsigned char green[] = { 0, 255, 0 };
const unsigned char blue[] = { 0, 0, 255 };
const unsigned char indigo[] = { 75, 0, 130 };
const unsigned char cyan[] = { 90, 234, 234 };
const unsigned char brown[] = { 166, 42, 42 };

const unsigned int gip_win_sizeX = 600; // Fenstergroesse X
const unsigned int gip_win_sizeY = 600; // Fenstergroesse Y
inline void gip_draw_rectangle(unsigned int x0, unsigned int y0,
	unsigned int x1, unsigned int y1, const unsigned char* const color = black) {}