#include <iostream>

void hanoi(int start, int hilfsstab, int ziel, int scheibenzahl)
{
	if (scheibenzahl == 1) // einfacher Fall mit einer Scheibe
	{
		std::cout << "Zeihe Scheibe von " << start << " nach " << ziel << std::endl;
		return; //denn void Fkt
	}
	//sonst, also wenn scheibezahl > 1
	//angenommen scheibenzahl == 4 (oder was anderes die > 1 ist) 
	else {
		hanoi(start, ziel, hilfsstab, scheibenzahl - 1);
			// dann eine Scheibe vom start auf den ziel stab versetzen(cout)

		std::cout << "Zeihe Scheibe von " << start << " nach " << ziel << std::endl;

		hanoi(hilfsstab, start, ziel, scheibenzahl - 1);
		return;
	}
}

	int main()
	{
		int scheibenzahl;
		std::cout << "Bitte geben Sie die Scheibenanzahl ein: ? ";
		std::cin >> scheibenzahl;

		int start_stab = 1, hilfs_stab = 2, ziel_stab = 3;

		hanoi(start_stab, hilfs_stab, ziel_stab, scheibenzahl);

		system("PAUSE");
		return 0;
	}
