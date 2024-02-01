#include <iostream>
#include "CMyVektor.h"
#include "CMyMatrix.h"

double f(CMyVektor x) {
	return pow(x[0], 3) * pow(x[1], 3) - 2 * x[1];
	//return 5 * pow(x[0], 2) * x[1];
}
double g(CMyVektor x) {
	return x[0] - 2;
	//return 2 * pow(x[2], 2) + 8;
}

CMyVektor main_f(CMyVektor x) {
	CMyVektor v = std::vector<double>{ f(x),g(x) };
	return v;
}


int main()
{
	//Test A3
	CMyVektor v = std::vector<double>{ 1,1 };
	newtonverfahren(v, main_f);

	return 0;
}