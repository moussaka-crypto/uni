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

//void CMyVektor::gradientenverfahren(CMyVektor x, double(*func)(CMyVektor x), double lambda)
//{
//	const double min_length = pow(10, -5); // min length des Gradienten
//	const int max_steps = 25;
//	int dim = x.getDim();
//
//	CMyVektor x_neu(dim);
//	CMyVektor grad_f_x(dim);
//	double f_x = 0.0, f_x_neu = 0.0;
//
//
//	int step = 0;
//	while (true)
//	{
//		x_neu = x + lambda * gradient(x, func);
//		f_x_neu = func(x_neu);
//
//		f_x = func(x);   // den vorherigen wert 
//		grad_f_x = gradient(x, func);
//
//		if (gradient(x_neu, func).getLen() < min_length)
//		{
//			cout << endl << "Ende wegen ||grad f(x)|| < " << min_length << " bei" << endl;
//
//			cout << "\tx = " << x << endl
//				<< "\tlambda = " << lambda << endl
//				<< "\tf(x) = " << f_x << endl
//				<< "\tgrad f(x) = " << grad_f_x << endl
//				<< "\t||grad f(x)|| = " << grad_f_x.getLen() << endl; break;
//		}
//		else if (step == 25)
//		{
//			cout << endl << "Ende wegen Schrittanzahl = " << max_steps << " bei" << endl;
//
//			cout << "\tx = " << x << endl
//				<< "\tlambda = " << lambda << endl
//				<< "\tf(x) = " << f_x << endl
//				<< "\tgrad f(x) = " << grad_f_x << endl
//				<< "\t||grad f(x)|| = " << grad_f_x.getLen() << endl; break;
//		}
//
//		cout << "Schritt " << step << ":" << endl << endl
//			<< "\tx = " << x << endl
//			<< "\tlambda = " << lambda << endl
//			<< "\tf(x) = " << f_x << endl
//			<< "\tgrad f(x) = " << grad_f_x << endl
//			<< "\t||grad f(x)|| = " << grad_f_x.getLen() << endl << endl
//			<< "\tx_neu = " << x_neu << endl
//			<< "\tf(x_neu) = " << f_x_neu << endl;
//
//		//Testen für neue x Werte
//		if (f_x_neu <= f_x)
//		{
//			do {
//				cout << endl << "\thalbiere Schrittweite (lambda = " << lambda * 0.5 << "):" << endl;
//				lambda *= 0.5;
//				x_neu = x + lambda * gradient(x, func); //Testwerte
//				f_x_neu = func(x_neu);
//				cout << "\tx_neu = " << x_neu << endl
//					<< "\tf(x_neu) = " << f_x_neu << endl;
//			} while (f_x_neu <= f_x);
//			x = x_neu;
//		}
//		else if (f_x_neu > f_x) // doppelten Sprung testen
//		{
//			CMyVektor x_test = x + (2 * lambda) * grad_f_x;
//			double f_x_test = func(x_test);
//
//			cout << "\tTest mit doppelter Schrittweite (lambda = " << lambda * 2 << "):" << endl
//				<< "\tx_test = " << x_test << endl
//				<< "\tf(x_test) = " << f_x_test << endl;
//
//			if (f_x_test > f_x_neu)	// wenn doppelter Sprung noch besser 
//			{
//				cout << "\tverdoppele Schrittweite!" << endl << endl;
//				x = x_test;
//				lambda *= 2;
//			}
//			else // lambda bleibt gleich
//			{
//				cout << "\tbehalte alte Schrittweite!" << endl << endl;
//				x = x_neu;
//			}
//		}
//		step++;
//	}
//}

