#include <iostream>
#include <string>
using namespace std;

int main()
{

	string text;
	char c;
	int pos;
	bool vorkommen = false;

	cout << "Text: " << '\n';
	getline(cin, text);

	cout << "Letter: " << '\n';
	cin >> c;

	for (int i = 0; i < text.length()-1; i++) {
		if (static_cast<int>(c) == static_cast<int>(text.at(i))) {
			pos = i + 1;
			vorkommen = true;
		}
	}
	if (vorkommen == true)
		cout << c << "an Position" << pos << '\n';
	else
		cout << c << " kommt nicht vor." << '\n';
	return 0;
}