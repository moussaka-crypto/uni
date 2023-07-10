#include "CLotto.h"
using std::vector;

void CLotto::set_ticket(std::vector<int> t)
{
	ticket = t;
}

CLotto::CLotto(int n_input, int k_input, int s) //2a
{
	this->n = n_input;
	this->k = k_input;
	if (s < 0)
		srand((int)time(NULL));
	else
		srand(s);

	ticket.resize(k);
}

std::vector<int> CLotto::Ziehung() //2c
{
	vector<int> ticket;
	CZufall value;
	for (int i = 0; i < k; i++)
	{
		int num = value.wert(1, n);

		while (find(ticket.begin(), ticket.end(), num) != ticket.end()) //immer unterschiedliche Werte!
		{
			num = value.wert(1, n);
		}
		ticket.push_back(num);
	}
	return ticket;
}

int CLotto::zahlen_gleich() // 2d
{
	vector<int> ticket1 = this->Ziehung();
	int cnt = 0;

	for (int i = 0; i < ticket1.size(); i++)
	{
		for (int j = 0; j < ticket.size(); j++)
		{
			if (ticket[j] == ticket1[i])
				cnt++;
		}
	}
	return cnt;
}

double CLotto::montecarlo(const int& r, const int& N, const int& typ)
{
	double res = 0.0;
	int gleich = 0;
	this->ticket = Ziehung();
	for (int i = 0; i <= N; i++)
	{
		if (typ == 2)
			this->set_ticket(Ziehung());
		gleich = zahlen_gleich();
		if (r == gleich)
		{
			res++;
		}
	}
	double ergebnis = (res / N) * 100;
	return ergebnis;
}