#include "CMyVektor.h"
#include <iostream>
using namespace std;

void CMyVektor::print() {


	cout << "(";
	for (int i = 0; i < this->GetDimension(); i++)
	{
		cout << this->getComp(i);
		if (i != this->GetDimension() - 1)
		{
			cout << "; ";
		}
		else {
			cout << ")" << endl;
		}
	}
}

double CMyVektor::length() {
	double len = 0;

	for (int i = 0; i < this->GetDimension(); i++)
	{

		len += pow(this->getComp(i), 2);

	}

	return sqrt(len);

}