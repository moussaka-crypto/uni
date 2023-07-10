#pragma once
#include <vector>
#include <iostream>
#include "CMyVektor.h"

class CMyMatrix
{
private:
	std::vector<std::vector<double>> matrix{ 0 }; // Vektor von Vektoren mit double Einträgen

public:
	CMyMatrix(std::vector<std::vector<double>> m) : matrix{ m } {} //Default

	CMyMatrix(const int& x, const int& y) // Matrix mit x Zeilen und y Spalten
	{
		this->matrix.resize(x, std::vector<double>(y));
	}

	std::vector<double>& operator[](double x)
	{
		return this->matrix.at(x);
	} //index operator überladen

	int getZ() const { return this->matrix.size(); }
	int getS() const { return this->matrix[0].size(); }

	CMyMatrix invers(); // inverse von 2x2 

	CMyVektor operator*(CMyVektor x); //matrix-vektor multiplikation

	void print(); //matrix ausgeben
	//friend std::ostream operator<<(std::ostream& os, CMyMatrix m);
};

CMyMatrix jacobi(CMyVektor x, CMyVektor(*func)(CMyVektor x));

void newtonverfahren(CMyVektor x, CMyVektor(*func)(CMyVektor x));