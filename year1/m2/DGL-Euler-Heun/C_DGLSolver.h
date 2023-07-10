#pragma once
#include "CMyVektor.h"

class C_DGLSolver {

private:
	bool DGL_sys;
	CMyVektor(*f_DGL_System)(CMyVektor y, double x);
	double (*f_DGL_nterOrdnung)(CMyVektor y, double x);

	CMyVektor ableitungen(CMyVektor y, double x);

public:
	void setDGL_status(bool arg) { DGL_sys = arg; }

	void set_Sys(CMyVektor(*f_DGL_System)(CMyVektor y, double x))
	{
		this->f_DGL_System = f_DGL_System;
	}

	void set_nOrd(double (*f_DGL_nterOrdnung)(CMyVektor y, double x))
	{
		this->f_DGL_nterOrdnung = f_DGL_nterOrdnung;
	}

	C_DGLSolver(CMyVektor(*f_DGL_System)(CMyVektor y, double x)) //fur System
	{
		setDGL_status(true); 
		set_Sys(f_DGL_System);
	}

	C_DGLSolver(double (*f_DGL_nterOrdnung)(CMyVektor y, double x)) // fur Gleichung nter Ordn
	{
		setDGL_status(false); 
		set_nOrd(f_DGL_nterOrdnung);
	}

	CMyVektor euler_raw(double x_start, double x_end, const int steps, CMyVektor y_start);
	CMyVektor heun_raw(double x_start, double x_end, const int steps, CMyVektor y_start);

	void euler(double x_start, double x_end, const int steps, CMyVektor y_start);
	void heun(double x_start, double x_end, const int steps, CMyVektor y_start); //Funktionen mit Ausgabe
};