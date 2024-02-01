#include <iostream>
#include "CMyVektor.h"
using namespace std;

double& CMyVektor::operator[](int i) //ersetzt die getComp methode
{
	return comp[i];
}

double CMyVektor::getLen()
{
	double length = 0;
	for (int i = 0; i < getDim(); i++)
	{
		length += (comp[i] * comp[i]);
	}
	return sqrt(length);
}

CMyVektor operator+(CMyVektor a, CMyVektor b)
{
	//if abfrage ob dim gleich
	int a_dim = a.getDim(), b_dim = b.getDim();

	if (a_dim == b_dim) {
		CMyVektor c(a.getDim());
		for (int i = 0; i < c.getDim(); i++)
		{
			c.setComp(a[i] + b[i], i);
		}
		return c;
	}
	else {
		cerr << "Dimensionen stimmen bei der Addition nicht :( " << endl; 
		exit(0); 
	}

}

CMyVektor operator*(double lambda, CMyVektor a)
{
	CMyVektor c(a.getDim());
	for (int i = 0; i < c.getDim(); i++)
	{
		c.setComp(lambda * a[i], i);
	}
	return c;
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

CMyVektor gradient(CMyVektor x, double (*func)(CMyVektor x))
{
	const double h = pow(10,-8);
	int dim = x.getDim(), counter = 0;
	CMyVektor gr_V(dim); // Gradientvektor
	CMyVektor h_V(dim);

	double diff_f = func(x); //opt

	for (int i = 0; i < dim; i++) // Positionen traversieren um Gradientenvektor zu bauen
	{
		double g = 0, sum = 0;

		for (int j = 0; j < dim; j++)
		{
			//if (j == counter) // wann x+h und wann nur x
			//{
			//	h_V.setComp(x[j] + h, j);
			//}
			//else
			//{
			//	h_V.setComp(x[j], j);
			//}

			((j == counter) ? h_V.setComp(x[j] + h, j) : // wann x+h und wann nur x
							  h_V.setComp(x[j], j));
		}
		sum = func(h_V); // Teil mit h
		g = (sum - diff_f) / h; //optimal

		counter++; // h bei jedem Element
		gr_V.setComp(g, i); //Gradient in gr_V platzieren
	}
	return gr_V;
}

void CMyVektor::gradientenverfahren(CMyVektor x, double(*func)(CMyVektor x), double lambda)
{
	const double min_length = pow(10, -5); // min length des Gradienten
	const int max_steps = 25;
	int dim = x.getDim();

	CMyVektor x_neu(dim);
	CMyVektor grad_f_x(dim);
	double f_x = 0.0, f_x_neu = 0.0;


	int step = 0;
	while (true)
	{
		x_neu = x + lambda * gradient(x, func);
		f_x_neu = func(x_neu);

		f_x = func(x);   // den vorherigen wert 
		grad_f_x = gradient(x, func);

		if (gradient(x_neu, func).getLen() < min_length)
		{
			cout << endl << "Ende wegen ||grad f(x)|| < " << min_length << " bei" << endl;

			cout << "\tx = " << x << endl
				 << "\tlambda = " << lambda << endl
				 << "\tf(x) = " << f_x << endl
				 << "\tgrad f(x) = " << grad_f_x << endl
				 << "\t||grad f(x)|| = " << grad_f_x.getLen() << endl; break;
		}
		else if (step == 25)
		{
			cout << endl << "Ende wegen Schrittanzahl = " << max_steps << " bei" << endl;

			cout << "\tx = " << x << endl
				 << "\tlambda = " << lambda << endl
				 << "\tf(x) = " << f_x << endl
				 << "\tgrad f(x) = " << grad_f_x << endl
				 << "\t||grad f(x)|| = " << grad_f_x.getLen() << endl; break;
		}

		cout << "Schritt " << step << ":" << endl << endl
			 << "\tx = " << x << endl
			 << "\tlambda = " << lambda << endl
			 << "\tf(x) = " << f_x << endl
			 << "\tgrad f(x) = " << grad_f_x << endl
			 << "\t||grad f(x)|| = " << grad_f_x.getLen() << endl << endl
			 << "\tx_neu = " << x_neu << endl
			 << "\tf(x_neu) = " << f_x_neu << endl;

		//Testen für neue x Werte
		if (f_x_neu <= f_x) 
		{
			do {
				cout << endl << "\thalbiere Schrittweite (lambda = " << lambda*0.5 << "):" << endl;
				lambda *= 0.5;
				x_neu = x + lambda * gradient(x, func); //Testwerte
				f_x_neu = func(x_neu);
				cout << "\tx_neu = " << x_neu << endl
					<< "\tf(x_neu) = " << f_x_neu << endl;
			} while (f_x_neu <= f_x);
			x = x_neu;
		}
		else if (f_x_neu > f_x) // doppelten Sprung testen
		{
			CMyVektor x_test = x + (2 * lambda) * grad_f_x;
			double f_x_test = func(x_test);

			cout << "\tTest mit doppelter Schrittweite (lambda = " << lambda * 2 << "):" << endl
				 << "\tx_test = " << x_test << endl
				 << "\tf(x_test) = " << f_x_test << endl;

			if (f_x_test > f_x_neu)	// wenn doppelter Sprung noch besser 
			{
				cout << "\tverdoppele Schrittweite!" << endl << endl;
				x = x_test;
				lambda *= 2;
			}
			else // lambda bleibt gleich
			{
				cout << "\tbehalte alte Schrittweite!" << endl << endl;
				x = x_neu;
			}
		}
		step++;
	}
}

