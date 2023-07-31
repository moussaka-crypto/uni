#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std;

double f(double x) // die zu integrierende Fkt
{
	//return sin(x);
	return cos(x);
	//return -x*x+2*x+3;
	//return 1;
}

double integral(double a, double b, int n) // a und b linker bzw rechter Intervallrand und n ist Anzahl der Zwischenintervalle
{
	double x, deltaX, summe;

	deltaX = (b - a) / n; //differenz
	summe = 0;
	x = a + deltaX / 2;

	for (int k = 1; k <= n; k++)
	{
		summe += f(x);
		x += deltaX;
	}
	return summe * deltaX;
}

int main()
{
	double a, b;
	int n;
	int control = 1;
	while (control)
	{
		cout << "Integration von sin(x) von a bis b ";
		cout << "mit n Zwischenstellen:\n";
		cout << "a = "; cin >> a;
		cout << "b = "; cin >> b;
		cout << "n = "; cin >> n;

		cout << setprecision(5) << "Integralwert = " << integral(a, b, n);
		cout << endl << endl;

		cout << "Nochmal berechnen? (1 = ja, 0 = nein) ";
		cin >> control;
	}
	return 0;
} 