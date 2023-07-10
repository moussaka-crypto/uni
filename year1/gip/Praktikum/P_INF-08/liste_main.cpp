#include <iostream>
#include <string>
using namespace std;
#define CATCH_CONFIG_RUNNER
#include "Catch.h"
#include "liste.h"
int main()
{
	Catch::Session().run();

	const int laenge = 10;
	TListenKnoten* anker = nullptr;

	cout << liste_als_string(anker) << endl;

	for (int i = 0; i < laenge; i++)
		hinten_anfuegen(anker, i * i);

	cout << liste_als_string(anker) << endl;
	system("PAUSE");
	return 0;
}