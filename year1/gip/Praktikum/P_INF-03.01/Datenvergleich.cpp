#include <iostream>
using namespace std;

int main()
{
	unsigned int tag_1, monat_1, jahr_1, tag_2, monat_2, jahr_2;

	cout << "Bitte geben Sie den Tag des ersten Datums ein: "; cin >> tag_1;
	cout << "Bitte geben Sie den Monat des ersten Datums ein: "; cin >> monat_1;
	cout << "Bitte geben Sie das Jahr des ersten Datums ein: "; cin >> jahr_1;

	cout << "\nBitte geben Sie den Tag des zweiten Datums ein: "; cin >> tag_2;
	cout << "Bitte geben Sie den Monat des zweiten Datums ein: "; cin >> monat_2;
	cout << "Bitte geben Sie das Jahr des zweiten Datums ein: "; cin >> jahr_2;
	
	if (tag_1 == 0 || tag_2 == 0 || monat_1 == 0 || monat_2 == 0)
	{
		cout << "\nEin solches Datum gibt es nicht." << endl;
	}
	else 
	{
		if (jahr_1 < jahr_2 || jahr_1 == jahr_2 && monat_1 < monat_2) // mizeriika malko...
		{
			cout << "\nDas erste Datum liegt vor dem zweiten Datum." << endl;
		}
		else if (jahr_1 > jahr_2 || jahr_1 == jahr_2 && monat_1 > monat_2)
		{
			cout << "\nDas zweite Datum liegt vor dem ersten Datum." << endl;
		}

		else if (tag_1 < tag_2 && jahr_1 == jahr_2 && monat_1 == monat_2)
		{
			cout << "\nDas erste Datum liegt vor dem zweiten Datum." << endl;
		}
		else if (tag_1 > tag_2 && jahr_1 == jahr_2 && monat_1 == monat_2)
		{
			cout << "\nDas zweite Datum liegt vor dem ersten Datum." << endl;
		}
		else if (tag_1 == tag_2 && jahr_1 == jahr_2 && monat_1 == monat_2)
		{
			cout << "\nBeide Datumsangaben sind gleich." << endl;
		}
	}
	return 0;
}