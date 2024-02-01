#include <iostream>
#include "CMyVektor.h"
using namespace std;

double f(CMyVektor x) {
	return sin(x[0] * x[1]) + sin(x[0]) + cos(x[1]);
}
double g(CMyVektor x) {
	return -(2 * pow(x[0], 2) - 2 * x[0] * x[1] + pow(x[1], 2) + pow(x[2], 2) - 2 * x[0] - 4 * x[2]);
}

int main()
{
	CMyVektor a(2);
	CMyVektor b(3);
	CMyVektor a_gr(2);
	CMyVektor b_gr(3);

	a.setComp(0.2, 0); a.setComp(-2.1, 1);
	b.setComp(0, 0); b.setComp(0, 1); b.setComp(0, 2);
	//CMyVektor c = a + b;
	//cout << c;
	a_gr = gradient(a, *f);
	cout << a_gr << endl;

	a.gradientenverfahren(a, *f);

	cout << endl;
	for (int i = 0; i < 88; i++)
		cout << "/";
	system("pause");

	b.setComp(0, 0); b.setComp(0, 1); b.setComp(0, 2);
	b_gr = gradient(b, *g);
	cout << b_gr << endl;

	b.gradientenverfahren(b, *g, 0.1);
}


