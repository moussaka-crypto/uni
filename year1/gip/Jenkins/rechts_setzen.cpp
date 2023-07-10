#include <iostream>
#include <string>

using namespace std;

int main()
{
	string e[4];
	int l[4];
	int c = 0;
	int le;
	for (int i = 0; i < 4; i++)
	{
		cout << "Textzeile = ? ";
		getline(cin, e[i]);
		if (e[i] == "")
		{
			break;
		}
		le = e[i].length();
		l[i] = le;
		c++;
	}

	int gr = 0;
	for (int i = 1; i < c; i++)
	{
		if (l[i] > l[i - 1])
		{
			gr = i;
		}
		else if (l[i] > l[i - 1])
		{
			gr = i - 1;
		}
	}

	for (int i = 0; i < c; i++)
	{
		le = l[gr] - l[i];
		for (int j = 0; j < le; j++)
		{
			cout << '#';
		}
		cout << e[i] << endl;

	}

	system("Pause");
	return 0;
}