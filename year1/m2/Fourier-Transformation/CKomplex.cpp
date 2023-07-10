#include "CKomplex.h"

CKomplex operator+(const CKomplex& a, const CKomplex& b)
{
	CKomplex sum(a.real + b.real, a.imag + b.imag);
	return sum;
}
CKomplex operator- (const CKomplex& a, const CKomplex& b)
{
	CKomplex diff(a.real - b.real, a.imag - b.imag);
	return diff;
}
CKomplex operator*(const CKomplex& a, const CKomplex& b)
{
	CKomplex prod(a.real * b.real - a.imag * b.imag, //Re
		a.real * b.imag + a.imag * b.real);//Im

	return prod;
}
CKomplex CKomplex::operator*(double c)
{
	CKomplex prod = CKomplex();
	prod.real = real * c;
	prod.imag = imag * c;
	return prod;
}

vector<CKomplex> fourier(vector<CKomplex> f, bool isHinT)
{
	const size_t N = f.size(); // N Datenpkte 
	const double coeff = 1 / sqrt(N);
	vector <CKomplex> c(N);
	double phi = 0.0;

	for (int n = 0; n < N; n++) { 
		CKomplex sum;
		for (int k = 0; k < N; k++) { // 0 to N - 1
			phi = (2 * M_PI * k * n) / N;
			if (isHinT) 
				phi *= -1;
			//cout << phi << endl;
			sum += f[k] * CKomplex(phi);
		}
		c[n] = sum * coeff; //Formel Skript S.32
	}
	return c;
}
double abweichung(vector<CKomplex> orig, vector<CKomplex> neu)
{
	double max_d = 0, diff = 0;
	const size_t N = orig.size();

	for (int i = 0; i < N; i++)
	{
		diff = (orig[i] - neu[i]).abs();

		if (diff > max_d)
			max_d = diff;
	}
	return max_d;
}