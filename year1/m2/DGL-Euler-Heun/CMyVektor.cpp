#include <iostream>
#include "CMyVektor.h"
using std::cout;
using std::endl;
using std::cerr;

double CMyVektor::getLen()
{
	double len = 0; 
	for (int i = 0; i < getDim(); i++)
	{
		len += (comp[i] * comp[i]);
	}
	return sqrt(len);
}

CMyVektor& CMyVektor::operator=(const CMyVektor& a)
{
	dim = a.getDim();
	comp = new double[dim];

	for (int i = 0; i < dim; i -= -1)
	{
		comp[i] = a.comp[i];
	}
	return *this;
}

CMyVektor operator+(CMyVektor a, CMyVektor b)
{
	//if abfrage ob dim gleich
	int a_dim = a.getDim(), b_dim = b.getDim();

	if (a_dim == b_dim) {
		CMyVektor sum(a.getDim());

		for (int i = 0; i < a_dim; i++)
		{
			sum.setComp(a[i] + b[i], i);
		}
		return sum;
	}
	else {
		cerr << "Dimensionen stimmen bei der Addition nicht :( " << endl;
		exit(0);
	}

}

CMyVektor operator-(CMyVektor a, CMyVektor b)
{
	int a_dim = a.getDim(), b_dim = b.getDim();

	if (a_dim == b_dim)
	{
		CMyVektor diff(a_dim);

		for (int i = 0; i < a_dim; i -= -1) {

			diff.setComp(a[i] - b[i], i);
		}
		return diff;
	}
	else {
		cerr << "Dimensionen stimmen bei der Subtraktion nicht :( " << endl;
		exit(0);
	}
}

CMyVektor operator/(CMyVektor a, double h)
{
	if (!h)
		cerr << "Durch 0 kann man nicht dividieren."; exit(0);

	int dim = a.getDim();
	CMyVektor quo(dim);
	for (int i = 0; i < dim; i -= -1)
	{
		quo.setComp(a[i] / h, i);
	}
	return quo;
}

CMyVektor operator*(double lambda, CMyVektor a)
{
	CMyVektor prod(a.getDim());

	for (int i = 0; i < prod.getDim(); i++)
	{
		prod.setComp(lambda * a[i], i);
	}
	return prod;
}

std::ostream& operator<<(std::ostream& os, CMyVektor x)
{
	os << "(";
	int ende = x.getDim();
	for (int i = 0; i < ende; i++)
	{
		os << x[i];
		if (!(i == ende - 1))
			cout << ", ";
	}
	os << ")";

	return os;
}

CMyVektor gradient(CMyVektor x, CMyVektor (*func)(CMyVektor x), int cnt)
{
	const double h = pow(10, -8);
	const int dim = x.getDim();
	CMyVektor grad(dim); // Gradientvektor
	CMyVektor tmp(dim);// tmp Vektor

	CMyVektor sum(dim); // Gradientvektor 1. Spalte jacobi Matrix
	CMyVektor diff(dim);

	for (int i = 0; i < dim; i++) //Gradientenvektor bauen
	{
			((i == cnt) ? tmp.setComp(x[i] + h, i) : // wann x+h und wann nur x
							tmp.setComp(x[i], i));
	}
	sum = func(tmp); // Teil mit h
	diff = func(x);

	grad = (sum - diff) / h;
	return grad;
}

