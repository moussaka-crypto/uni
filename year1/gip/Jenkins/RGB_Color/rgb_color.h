#pragma once
class RGB_Color {
private:
	int red, green, blue;
public:
	RGB_Color() : red{255}, green{255}, blue{255} {} // RGB_color c;
	RGB_Color(int r, int g, int b) : red{r}, green{g}, blue{b} {} // RGB_color c(...);

	int get_red() { return red; }
	int get_green() { return green; }
	int get_blue() { return blue; }

	void set_red(int r) {
		if (r >= 0 && r <= 255)
			red = r;
	}
	void set_green(int g) {
		if (g >= 0 && g <= 255)
			green = g;
	}
	void set_blue(int b) {
		if (b >= 0 && b <= 255)
			blue = b;
	}

	void display();
	void set_color(int r, int g, int b);
	bool input_color();
};