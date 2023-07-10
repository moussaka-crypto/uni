#include "CZufall.h"
#include "CLotto.h"
using namespace std;

void print(vector<int> out)
{
	for (int i = 0; i < out.size(); i++)
	{
		if (i == 0)
			cout << "(" << out[i];
		else
			cout << out[i];
		if (i < out.size() - 1)
			cout << ", ";
		if (i == out.size() - 1)
			cout << ")";
	}
	cout << endl;
}

int main()
{
	CZufall random;

	cout << "a)" << endl;
	for (int i = 1; i <= 5; i++)
	{
		random.initialisiere(8);
		print(random.test(3, 7, 10000));
	}

	cout << endl << "b)" << endl;
	for (int i = 1; i <= 5; i++)
	{
		random.initialisiere(random.wert(1,1000));
		print(random.test(3, 7, 10000));
	}

	cout << endl << "c)" << endl;
	for (int i = 1; i <= 5; i++)
	{
		random.initialisiere((int)time(NULL));
		print(random.test(3, 7, 10000));
	}

	cout << endl << "d)" << endl;
	print(random.test_falsch(3, 7, 10000));

	cout << endl << "A3" << endl;
	CLotto lotto(36, 5, -1);

	for (int i = 100; i <= 10000000; i *= 10)
	{
		cout << "Typ 1: " << lotto.montecarlo(2, i, 1) << " % bei N = " << i << endl;
		cout << "Typ 2: " << lotto.montecarlo(2, i, 2) << " % bei N = " << i << endl;
	}


}