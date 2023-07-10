#include <iostream>
using namespace std;

int main()
{
	int z = 1;
	int wert2 = 10;
	int	wert3 = 10;
	for ( int z=1; z<11; z++, wert2*=2, wert3*=3)
	{
		cout << "Zeile: " << z
			<< " Verdoppler: " << wert2
			<< " Verdreifacher: " << wert3
			<< endl;
	}
	
	system("PAUSE");
	return 0;
}