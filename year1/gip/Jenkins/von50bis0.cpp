#include<iostream>
using namespace std;

int main()
{
	int zahl;
	cin >> zahl;
	while (zahl >= 0)
	{
		cout << zahl << endl;
		zahl -= 5;

	}
	system("PAUSE");
	return 0;
}