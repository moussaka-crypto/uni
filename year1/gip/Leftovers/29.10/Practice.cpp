#include <iostream>
using namespace std;

int main()
{
	const int arr_length = 10;
	int array[arr_length] = { 3,8,2,10,1,12,8,4,11,9 };

	//Wiederholen, so oft wie Arrayelemente 
	for (int anzahl = 0; anzahl < arr_length; anzahl++)
	{
		bool habe_noch_getauscht = false; //optimierung

		//Aufsteigephase:
		//	Von links nach rechts durchlaufen

		for (int index = 0; index < arr_length-1; index++) 
		{
			//Nachbarn vergleichen
			if (array[index] > array[index + 1])
			{
				// ggfs tauschen
				int tmp = array[index];

				array[index] = array[index + 1];

				array[index + 1] = tmp;

				habe_noch_getauscht = true; //optimierung //bool var wird hier auf true gesetzt, damit wenn sie spaeter nicht gesetzt wird, die Schleife endet
			}
		}
		//Nach der Aufsteigephase //optimierung
		if (!habe_noch_getauscht) {
			//cout << "Weiter mit der Schleife, noch eine Phase";
			break;
		}
	}
	// Ausgabe des Ergebnisses
	for (int i = 0; i < arr_length; i++)
		cout << array[i] << endl;

	system("PAUSE");
	return 0;
}

void swap(int* x, int* y) {
	int tmp = *x;
	*x = *y;
	*y = tmp;
}

void print(int arr[], int n) {
	for (int i = 0; i < n; i++) {
		cout << arr[i] << " ";
	}
	cout << '\n';
}

void BubbleSort(int arr[], int n) {

	for (int i = 0; i < n-1; i++) {
		for (int j = 0; j < n - i - 1; j++) {

			if (arr[j] > arr[j + 1]) {
				swap(&arr[j], &arr[j + 1]);
			}
		}
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n-1 ; j++) {

			if (arr[j] > arr[j + 1]) {
				swap(&arr[j], &arr[j + 1]); }}}
}

int ggt(int a, int b) {
	int r;
	while (a % b > 0) {
		r = a % b;
		a = b;
		b = r;
	}
	return b;
}

int main2() {

	int* b = new int(10);
	b[0] = 1;
	for (int i = 1; i < 10; i++)
	{
		b[i] = b[i - 1] + 2;
	}

	int* p1 = &b[0];
	int c = *(p1 + 5);
	int* p2 = &b[2];
	int d = *p1 + *p2;

	cout << c << endl;
	cout << d << endl;


	const int size = 7;
	int arr[] = { 3, 8, 2, 1, 10, 12, 8 };
	//int size = sizeof(arr)/sizeof(arr[0]); //x*4(ganzes array in bytes) / 4(int size in bytes);
	
	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size - 1; j++) {
			if (arr[j] > arr[j + 1]) {
				int tmp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = tmp;
			}
		}
	}
	print(arr, size);

	cout << ggt(22, 4);

	for (int i = 0; i < 20; i -= -1) {
		cout << i + 1 << endl;
	}


	int arr[9] = {};
	for (int i = 0; i < 9; i++) {
		while (arr[i] < 1 || arr[i] > 6) {
			cout << "Die " << i + 1 << ". Zahl eingeben: "; cin >> arr[i];
		}
	}
	cout << '\n';

	for (int i = 0; i < 9; i++) {
		cout << "Die " << i + 1 << ". Zahl ist: " << arr[i] << '\n';
	}
	cout << '\n';

	int h[6] = { 0 };
	for (int i = 0; i < 9; i++) {
		for (int count = 0; count < 6; count++) {
			if (arr[i] == count + 1) {
				h[count]++;
			}
		}
	}

	for (int count = 0; count < 6; count++) {
		cout << "Zahl " << count + 1 << " wurde " << h[count] << ". Mal ausgegeben." << '\n';
	}
	cout << '\n';
}