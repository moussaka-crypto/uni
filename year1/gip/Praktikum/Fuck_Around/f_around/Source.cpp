#include <iostream>
#include <string>
using namespace std;

void reverse(const string& s, int pos = 0) {
	if (pos < s.length()) {
		reverse(s, pos + 1);
		cout << s.at(pos);
	}
}

//string reverse(string& s, int pos = 0) {
//
//	if (pos < s.length()) {
//		reverse(s, pos + 1);
//		//cout << s.at(pos);
//	}
//	string sr;
//	sr += s.at(pos);
//	return sr;
//}

int main() {
	string s;
	getline(cin, s);
	reverse(s);
	cout << endl;

	system("pause");
	return 0;
}