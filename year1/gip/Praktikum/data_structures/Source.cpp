#include <iostream>
#include <string>
#include <map>
#include <list>
using namespace std;

int main()
{
	map< int, string > hash_1;
	hash_1[1] = "Aachen";

	cout << hash_1[1] << endl;

	hash_1[2] = "Heinsberg";
	cout << hash_1[2] << endl;

	map<int, string>NV_faction;
	NV_faction[1] = "NCR";
	NV_faction[2] = "Legion";
	NV_faction[3] = "Mr. House";
	NV_faction[4] = "Yes Man";
	
	cout << "Enter a number, Courier: "; int n;  cin >> n;
	switch (n) {
	case 1:
		cout << NV_faction[1];
		break;
	case 2:
		cout << NV_faction[2];
		break;
	case 3:
		cout << NV_faction[3];
		break;
	case 4:
		cout << NV_faction[4];
		break;
	}

	map<string, int> wordCount;
	string word;
	ifstream input("eingabedatei.txt");

	if (!input) {
		cout << "Probleme beim Oeffnen der Datei" << endl;
		system("PAUSE"); return 99;
	}
	while (input >> word)
		++wordCount[word];

	for (const pair<string, int>& p : wordCount)
		cout << p.first << " : " << p.second << endl;


	list<int> mylist;
	for (int i = 0; i <= 9; i++) {
		mylist.push_back(i);
	}
	mylist.push_back(6); 
	mylist.push_back(2);
	mylist.push_back(7); 
	mylist.push_back(4);
	
	for (const int& entry : mylist)
		cout << entry << endl;

	for (list<int>::iterator it = mylist.begin(); it != mylist.end(); ++it)
	{
		cout << *it << endl; // … wie das Dereferenzieren eines Pointers
	}


}