#include <iostream>
using namespace std;

int main() {

	int age = 0;
	char gender;
	cout << "Age: "; cin >> age;
	cout << "Gender: "; cin >> gender;

	switch (gender) {
	case 'm':
		cout << "He is a " << age << "-year old gentleman." << endl;
		break;
	case 'f':
		cout << "She is a " << age << "-year old lady." << endl;
		break;
	default:
		cout << "Isuska, stiga be brat" << endl;
	}
}