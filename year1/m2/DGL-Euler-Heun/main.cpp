#include <iostream>
#include "CMyVektor.h"
#include "C_DGLSolver.h"
using std::cout;
using std::endl;
#include <fstream>

CMyVektor DGL_System(CMyVektor yV, double x) // 4.1
{ 

	/*
	y′1 = 2y2 − xy1,
	y′2 = y1y2 − 2x^3

	y1(0) = 0, y2(0) = 1.
	*/

	int dim = yV.getDim();
	CMyVektor V(dim);

	double y1 = yV[0], y2 = yV[1];

	V.setComp(2 * y2 - x * y1, 0);
	V.setComp(y1 * y2 - 2 * pow(x, 3), 1);
	return V;
}

double DGL_nOrd(CMyVektor yV, double x) // 4.2
{
	//y′′′ = 2xy′y′′ + 2y^2y′	y(1) = 1, y′(1) = −1, y′′(1) = 2
	double y0 = yV[0],
		   y1 = yV[1],
		   y2 = yV[2];
	return 2 * x * y1 * y2 + 2 * pow(y0, 2) * y1;
}

int main()
{
	//4.1
	C_DGLSolver ersteOrdnung(DGL_System);
	CMyVektor start(2);
	start.setComp(0, 0);
	start.setComp(1, 1);

	cout << "////////////////////////EULERVERFAHREN////////////////////////\n"; system("pause"); cout << endl;
	ersteOrdnung.euler(0, 2, 100, start);

	cout << "////////////////////////HEUNVERFAHREN////////////////////////\n"; system("pause"); cout << endl;
	ersteOrdnung.heun(0, 2, 100, start);

	//4.2
	C_DGLSolver dritteOrdnung(DGL_nOrd);
	CMyVektor startV(3);
	//CMyVektor tmp_E(3), tmp_H(3);
	startV.setComp(1, 0);
	startV.setComp(-1, 1);
	startV.setComp(2, 2);

	int steps = 10;

	cout << "////////////////////////ABWEICHUNGEN////////////////////////\n"; system("pause"); cout << endl;
	
	for (; steps <= 10000; steps *= 10) {
														  //y(2) = 0.5 exakte Loesung
		cout << "Euler bei " << steps << " Schritten: " << (0.5 - dritteOrdnung.euler_raw(1.0, 2.0, steps, startV)[0]) << endl;

		cout << "Heun bei " << steps << " Schritten: " << (0.5 - dritteOrdnung.heun_raw(1.0, 2.0, steps, startV)[0]) << endl << endl;

	}

	return 0;
}