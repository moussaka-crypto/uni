#pragma once
#include <cmath>

class CMyVektor
{
private:
	int dim;
	double* comp;

public:
	CMyVektor(int dim) : dim(dim) { comp = new double[dim]; }

	int getDim() const { return dim; }

	void setComp(double num, int i) { comp[i] = num; }

	double& operator[](int i);

	double getLen();

	friend CMyVektor operator+(CMyVektor a, CMyVektor b);

	friend CMyVektor operator*(double lambda, CMyVektor a);

	friend std::ostream& operator<<(std::ostream& os, CMyVektor x);

	friend CMyVektor gradient(CMyVektor x, double (*func)(CMyVektor x));

	void gradientenverfahren(CMyVektor x, double(*func)(CMyVektor x), double lambda = 1.0); 
};







