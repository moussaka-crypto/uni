// Datei: main.cpp

#include <iostream>
using namespace std;
#define CATCH_CONFIG_RUNNER
#include "catch.h"

int main()
{
	/*int result =*/ Catch::Session().run();

	system("PAUSE");
	return 0;
}
