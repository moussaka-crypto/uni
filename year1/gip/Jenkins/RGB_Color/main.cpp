#include "RGB_Color.h"
#include <iostream>

int main() {
	RGB_Color white;
	RGB_Color cyan(0, 255, 255);
	RGB_Color yellow(255, 255, 0);
	RGB_Color magenta(255, 0, 255);

	std::cout << "White:\n";
	white.display();
	std::cout << '\n';

	std::cout << "Cyan:\n";
	cyan.display();
	std::cout << '\n';

	std::cout << "Yellow:\n";
	yellow.display();
	std::cout << '\n';

	std::cout << "Magenta:\n";
	magenta.display();
	std::cout << '\n';

	system("pause");
	std::cout << '\n';

	RGB_Color colour1(255, 255, 128);
	std::cout << "Colour 1:\n";
	colour1.display();
	std::cout << '\n';

	RGB_Color colour2 = colour1; //Copy Konstruktor automatisch
	std::cout << "Colour 2:\n";
	colour2.display();
	std::cout << '\n';

	system("pause");
	std::cout << '\n';

	if (colour2.input_color() == false)
		std::cout << "Falsche Eingabe!\n";
	else
	{
		std::cout << '\n';
		std::cout << "New Colour 2:\n";
		colour2.display();
	}

	return 0;
}