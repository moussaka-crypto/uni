#pragma once
#include <cmath>
#include<vector>
class CMyVektor
{
private:
	std::vector<double> x{ 0 };

public:
	CMyVektor(int dimension) { this->setDimension(dimension); }
	CMyVektor(std::vector<double> x) : x{ x } {}
	CMyVektor(const CMyVektor& a) : x{ a.x } {}

	double length();
	void setDimension(int n) { this->x.resize(n); }
	size_t GetDimension() const { return this->x.size(); }

	void setComp(int index_n, double x_n) { this->x.at(index_n) = x_n; }
	double getComp(int index_n) const { return this->x.at(index_n); }

	double& operator[](int i) { return x.at(i); }

	void print();

	friend CMyVektor operator*(double lambda, const CMyVektor& a) {
		CMyVektor result = a;
		for (int i = 0; i < result.GetDimension(); i++)
		{
			result.setComp(i, result.getComp(i) * lambda);
		}

		return result;
	}

	friend CMyVektor operator+(const CMyVektor& a, const CMyVektor& b) {

		CMyVektor result = a;
		CMyVektor operand = b;
		for (int i = 0; i < result.GetDimension(); i++)
		{
			result.setComp(i, result.getComp(i) + operand.getComp(i));
		}

		return result;
	}

	friend CMyVektor operator-(const CMyVektor& a, const CMyVektor& b) {

		CMyVektor result = a;
		CMyVektor operand = b;
		for (int i = 0; i < result.GetDimension(); i++)
		{
			result.setComp(i, result.getComp(i) - operand.getComp(i));
		}

		return result;
	}

	friend CMyVektor gradient(const CMyVektor& x, double (*funktion)(CMyVektor x)) {

		double h = pow(10, -8);
		double f0 = funktion(x);
		double f1 = 0;
		CMyVektor result = x;
		CMyVektor grad = result;

		for (int i = 0; i < result.GetDimension(); i++)
		{
			result.setComp(i, result.getComp(i) + h);
			f1 = funktion(result);

			double dXn = (f1 - f0) / h;

			grad.setComp(i, dXn);
			result.setComp(i, x.getComp(i));
		}

		return grad;
	}

	std::vector<double> getVector() const {
		return this->x;
	}
};