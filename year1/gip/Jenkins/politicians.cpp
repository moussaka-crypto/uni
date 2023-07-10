#include<iostream>
using namespace std;

int main()
{
	int gesamtZahl, esrteStimmen, zweiteStimmen = 0;
	cout << "Bitte geben Sie die Gesamtzahl der abgegebenen gueltigen Stimmen ein: ? ";
	cin >> gesamtZahl;

	cout << "Bitte geben Sie die Anzahl Stimmen des ersten Kandidaten ein: ? ";
	cin >> esrteStimmen;

	cout << "Bitte geben Sie die Anzahl Stimmen des zweiten Kandidaten ein: ? ";
	cin >> zweiteStimmen;

	int dritteStimmen = gesamtZahl - (esrteStimmen+zweiteStimmen);
	cout <<"Auf den dritten Kandidaten sind somit "<< dritteStimmen <<" Stimmen entfallen." << endl;

	double kandidat1= double(esrteStimmen);
	double kandidat2= double(zweiteStimmen);
	double kandidat3= double(dritteStimmen);

	cout << "Kandidat 1 erhielt " << kandidat1 * 100/ gesamtZahl << "% der Stimmen." << endl;
	cout << "Kandidat 2 erhielt " << kandidat2 * 100 / gesamtZahl << "% der Stimmen."<< endl;
	cout << "Kandidat 3 erhielt " << kandidat3 * 100 / gesamtZahl << "% der Stimmen."<< endl;

	system("PAUSE");
	return 0;
}