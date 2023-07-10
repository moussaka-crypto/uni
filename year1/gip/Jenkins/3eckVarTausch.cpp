#include <iostream>
using namespace std;

int main()
{
	int v1, v2, v_tmp = 0;
	
	cout << "Bitte geben Sie den ganzzahligen Wert der ersten Variable ein: ? ";
	cin >> v1;

	cout << "Bitte geben Sie den ganzzahligen Wert der zweiten Variable ein: ? ";
	cin >> v2;

	v_tmp = v1;
	v1 = v2;
	v2 = v_tmp;

	cout << "Nach dem Tausch:" << endl;
	cout << "Wert der ersten Variable: " << v1 << endl;
	cout << "Wert der zweiten Variable: " << v2 << endl;

	system("PAUSE");
	return 0;
}