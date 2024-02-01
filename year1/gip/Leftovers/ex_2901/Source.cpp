#include <iostream>
using namespace std;

bool isFibbonacci(int n) {

	int fib_new, fib1 = 2, fib2 = 3;
	if (n <= 3) //01123
		return true;
	while (n > fib2) {
		fib_new = fib1 + fib2;
		if (n == fib_new)
			return true;
		else {
			fib1 = fib2;
			fib2 = fib_new;
		}
	}
	return false;
}


int arr[6] = {};
for (int i = 0; i < 6; i++) {
	while (arr[i] < 1 || arr[i]>6) {
		cout << "Die " << i + 1 << ". Zahl des Arrays ? "; cin >> arr[i];
		cout << endl;
	}
}

int suchzahl;
cout << "Nach welcher Zahl suchen Sie ? "; cin >> suchzahl;

int count = 0;
for (int i = 0; i < 6; i++) {
	count++;
	if (suchzahl == arr[i])
	{
		cout << "Zahl ist vorgekommen.";
		break;
	}
	if (count == 6)
		cout << "Die Suchzahl ist nicht vorgekommen. ";
}


std::string removeExclamationMarks(std::string str) {
   std::string str_copy;

   for (int i = 0; i < str.length(); i++) {
      
       if (str[i] == ' ') continue;
       str_copy += str[i];
   }
   return str_copy;
}

int main() {
    std::string str = std::string("Hel lo!");
    std::cout << removeExclamationMarks(str);}
