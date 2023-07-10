#pragma once
#define _USE_MATH_DEFINES
#include <vector>
#include <iostream>
#include <math.h>
#include <fstream>
//for FFT und iFFT
#include <complex>
#include <valarray> 

using namespace std;
class CKomplex {
private:
	double real;
	double imag;
public:
	CKomplex() : real{ 0 }, imag{0} {} // 0+0j Default
	CKomplex(double a, double b) : real{a}, imag{b} {} 	//  a+bj
	CKomplex(double phi) : real{cos(phi)}, imag{sin(phi)} {} // e^(jphi)

	double re() { return real; }
	double im() { return imag; }
	double abs() { return sqrt((real * real) + (imag * imag)); }

	friend CKomplex operator+(const CKomplex&, const CKomplex&); 
	friend CKomplex operator-(const CKomplex&, const CKomplex&);
	friend CKomplex operator*(const CKomplex&, const CKomplex&);
	CKomplex operator*(double);
	CKomplex operator+=(const CKomplex& a)
	{
		this->real += a.real;
		this->imag += a.imag;
		return *this;
	}

	friend vector<CKomplex> fourier(vector<CKomplex>, bool);
	friend double abweichung(vector<CKomplex>, vector<CKomplex>);
};