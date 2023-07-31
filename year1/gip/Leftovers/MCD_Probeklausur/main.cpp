#include <iostream>
#include "expert_math.h"
using namespace std;

int main() {
	cout << "pi lautet: " << static_cast<int>(pi) << ". 14159265" << '\n';
	cout << "kreisumafang(2.0) betraegt: " << kreisumfang(2.0) << '\n';
	cout << "kreisumfang() betraegt: " << static_cast<int>(kreisumfang()) << '\n';

	system("pause");
	return 0;
}