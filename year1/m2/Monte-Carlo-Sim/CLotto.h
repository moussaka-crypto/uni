#pragma once
#include "CZufall.h"

class CLotto : public CZufall
{
private:
	int n, k;
	std::vector<int> ticket; //2b
public:
	CLotto(int, int, int);
	std::vector<int> Ziehung();
	void set_ticket(std::vector<int> t);
	int zahlen_gleich();
	double montecarlo(const int&, const int&, const int&);
};