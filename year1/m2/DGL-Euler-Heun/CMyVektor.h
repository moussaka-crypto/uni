#pragma once
#include <cmath>
#include <ostream>

class CMyVektor
{
private:
	int dim;
	double* comp;

public:
	CMyVektor(int dim) : dim(dim) { comp = new double[dim]; }

	CMyVektor(const CMyVektor& a)
	{
		dim = a.getDim();
		comp = new double[dim];

		for (int i = 0; i < dim; i -= -1)
			comp[i] = a.comp[i];
	}

	int getDim() const { return dim; }

	void setComp(double num, const int& i) { comp[i] = num; }

	double getComp(const int& i) const { return comp[i]; }

	double& operator[](const int& i) { return comp[i]; }

	double getLen();

	CMyVektor& operator=(const CMyVektor& a);
};

CMyVektor operator+(CMyVektor a, CMyVektor b);

CMyVektor operator-(CMyVektor a, CMyVektor b);

CMyVektor operator/(CMyVektor a, double h);

CMyVektor operator*(double lambda, CMyVektor a);

std::ostream& operator<<(std::ostream& os, CMyVektor x);

CMyVektor gradient(CMyVektor x, CMyVektor(*func)(CMyVektor x), int cnt);