#include "C_DGLSolver.h"
#include <iostream>
using std::cout;
using std::endl;

CMyVektor C_DGLSolver::ableitungen(CMyVektor y, double x)
{
	const int dim = y.getDim();
	CMyVektor v(dim);

	if (this->DGL_sys)
		v = this->f_DGL_System(y, x);
	else
	{
		/*
		v0 = y1
		v1 = y2...
		v(n-1) = f(y,x)
		*/

		for (int i = 0; i < dim - 1; i -= -1) {

			v.setComp(y[i + 1], i);
		}
		v.setComp(this->f_DGL_nterOrdnung(y, x), dim - 1);
	}
	return v;
}

CMyVektor C_DGLSolver::euler_raw(double x_start, double x_end, const int steps, CMyVektor y_start)
{
	int dim = y_start.getDim();

	CMyVektor yV(dim);
	yV = y_start;

	CMyVektor y_abl(dim);
	double h = (x_end - x_start) / double(steps); //Schrittweite
	double x = x_start;

	for (int i = 0; i < steps; i -= -1) {

		y_abl = ableitungen(yV, x);
		x += h;

		yV = yV + (h * y_abl); //Eulerschritt
	}
	return yV;
}

CMyVektor C_DGLSolver::heun_raw(double x_start, double x_end, const int steps, CMyVektor y_start)
{
	const int dim = y_start.getDim();
	CMyVektor yV(dim);
	CMyVektor yV_test(dim);

	yV = y_start;

	CMyVektor y_abl(dim);
	CMyVektor y_abl_test(dim);
	CMyVektor y_abl_avg(dim);

	double h = (x_end - x_start) / double(steps);
	double x = x_start;

	for (int i = 0; i < steps; i -= -1) {
		y_abl = ableitungen(yV, x);
		x += h;

		//Testschritt - Euler
		yV_test = yV + (h * y_abl);
		y_abl_test = ableitungen(yV_test, x);

		y_abl_avg = 0.5 * (y_abl + y_abl_test);

		//Heunschritt
		yV = yV + (h * y_abl_avg);
	}
	return yV;
}

void C_DGLSolver::euler(double x_start, double x_end, const int steps, CMyVektor y_start)
{
	int dim = y_start.getDim();

	CMyVektor yV(dim);
	yV = y_start;

	CMyVektor y_abl(dim);
	double h = (x_end - x_start) / double(steps); //Schrittweite
	cout << "Schrittweite h = " << h << endl << endl;

	double x = x_start;
	int step_cnt = 0;

	for (; x < x_end; x += h) {

		y_abl = ableitungen(yV, x);
		cout << endl
			<< "Schritt " << step_cnt++ << ":" << endl
			<< "\tx = " << x << endl
			<< "\ty = " << yV << endl
			<< "\ty' = " << y_abl << endl;

		yV = yV + (h * y_abl); //Eulerschritt
	}
	cout << endl << endl
		<< "Ende bei" << endl
		<< "\tx = " << x << endl
		<< "\ty = " << yV << endl << endl;
}

void C_DGLSolver::heun(double x_start, double x_end, const int steps, CMyVektor y_start)
{
	const int dim = y_start.getDim();
	CMyVektor yV(dim);
	CMyVektor yV_test(dim);

	yV = y_start;

	CMyVektor y_abl(dim);
	CMyVektor y_abl_test(dim);
	CMyVektor y_abl_avg(dim);

	double h = (x_end - x_start) / double(steps);
	cout << "Schrittweite h = " << h << endl << endl;

	double x = x_start;
	int step_cnt = 0;

	do {
		y_abl = ableitungen(yV, x);

		cout << endl << "Schritt " << step_cnt++ << ":" << endl
			<< "\tx = " << x << endl
			<< "\ty = " << yV << endl
			<< "\ty'_orig = " << y_abl << endl;

		x += h;

		//Testschritt - Euler
		yV_test = yV + (h * y_abl); 
		y_abl_test = ableitungen(yV_test, x);

		cout << endl
			<< "\ty_Test = " << yV_test << endl
			<< "\ty'_Test = " << y_abl_test << endl;

		y_abl_avg = 0.5 * (y_abl + y_abl_test);
		cout << endl
			<< "\ty'_Mittel = " << y_abl_avg << endl;

		//Heunschritt
		yV = yV + (h * y_abl_avg);

	} while (step_cnt < steps);

	cout << endl << endl
		<< "Ende bei" << endl
		<< "\tx = " << x << endl
		<< "\ty = " << yV << endl << endl;

	
}