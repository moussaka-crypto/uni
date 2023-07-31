#include "math.h"

int addiere(int a, int b)
{
	return a + b;
}

int subtrahiere(int a, int b)
{
	return a - b;
}

int multipliziere(int a, int b)
{
	return a * b;
}

int fakultaet(unsigned int n){
	if (n == 0 || n == 1) // 0!=1!=1
		return 1;
	else {
		int resultat = 1;
		for (int i = 2; i <= n; i++) // ab 2!
		{
			resultat = resultat * i;
		}
		return resultat;
	}
}