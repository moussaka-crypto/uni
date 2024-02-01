#include <iostream>
#include <string>
using namespace std;

struct Person {
	string name;
	int alter;
};

Person willi{ "Willi", 36 };



int f(int &x);

int f(int x = 30)
{
	return x * 2;
}

int main() {
	do {
		int i = 2;
		cout << "i hat den wert: " << i << endl;
		i++;
	} while (i * i < 5);

	cout << f() << endl;

	for (int i = 1; i < 3; i++) {
		for (int k = 1; k <= 4; k++) {
			cout << i << " und " << k << endl;
			if (k == 3) {
				cout << "Break if-3" << endl;
				break;
			}
			switch (k) {
				case 2:
					cout << "Break case-2" << endl;
					break;
				case 3:
					cout << "Break case-3" << endl;
					break;
			}
		}
	}
	
	system("Pause");
	return 0;
}