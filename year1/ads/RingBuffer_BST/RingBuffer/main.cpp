//#define CATCH_CONFIG_RUNNER

#include <iostream>
#include <string>
#include "Ring.h"
//#include "catch.h"

using namespace std;

void clearInput() {
	cin.clear();
	cin.ignore(numeric_limits<streamsize>::max(), '\n');
}

void Backup_UI() {

	Ring Backup;
	bool quit = false;
	int input;
	string Desc;
	string Data;
	string data_to_be_found;
	
	cout << "===========================================" << endl
		 << "Black Mesa Backup System, by Gordon Freeman" << endl
		 << "===========================================" << endl << endl;
	
	while (!quit) {
		cout << "////////Enter your desired operation.////////" << endl;
		cout << "1) Make new backup" << endl
			 << "2) Search for backup" << endl
			 << "3) List all backups" << endl
			 << "4) Exit program" << endl << endl;
	
		cout << "?> "; 
		try {
			cin >> input;
			if (input < 1 || input > 4)
				throw input;
		} 
		catch (...) {
			cout << "There is no such operation." << endl;
			clearInput();
		}
		cout << endl;
	
		switch (input)
		{
		case 1:
			cout << "Making new backup..." << endl << endl;
			cout << "Enter Description: "; getline(cin >> ws, Desc);
			cout << endl << "Enter Data: "; getline(cin >> ws, Data);
			Backup.addNewNode(Desc, Data);
			cout << "New backup successful." << endl << endl;
			break;
	
		case 2:
			cout << "What data should be found?" << endl; 
			cout << "?> ";
			cin >> data_to_be_found; cout << endl;

			if (!Backup.search(data_to_be_found)) {
				
				cout << "Try again later."
					<< endl << endl; //Sleep(1000);
			}
			break; // funktioniert
		case 3:
			cout << "Listing all backups..." << endl;
			Backup.print(); break;
		case 4:
			quit = true;
			cout << "Exiting..." << endl;
			break;
		default:
			break;
		}
	}	
}

int main()
{
	//int result = Catch::Session().run();
	Backup_UI();
	
	system("Pause");
	return 0;
}
