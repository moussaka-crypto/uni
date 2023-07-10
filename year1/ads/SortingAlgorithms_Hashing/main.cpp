//#define CATCH_CONFIG_RUNNER
//#include "catch.h"
#include <iostream>
#include <omp.h>
#include"hashtable.h"
#include "sorting.h"
using namespace std;

void benchmark_insertionsort()
{
	//file stream
	ofstream insertionsort_measurement;
	insertionsort_measurement.open("InsertionSort.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 100;
	int n_step = 1;
	int n_end = 1000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running InsertionSort with n: " << n << std::endl;
		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::InsertionSort(V, n);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}
		
		n_avg *= 0.1;

		//write to file
		insertionsort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	insertionsort_measurement.close();
}

void benchmark_quicksort_low() {

	//file stream
	ofstream quicksort_measurement;
	quicksort_measurement.open("QuickSort_low.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 100;
	int n_step = 1;
	int n_end = 1000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Quicksort with n: " << n << std::endl;
		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::QuickSort(V, 0, V.size() - 1);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;

		//write to file
		quicksort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	quicksort_measurement.close();
}

void benchmark_quicksort() {

  //file stream
  ofstream quicksort_measurement;
  quicksort_measurement.open("quicksort.txt", ios::out | ios::app);

  //benchmark parameters / variables
  double dtime;
  double n_avg = 0;
  int n_start = 1000;
  int n_step = 1000;
  int n_end = 1000000;

  vector<int> V;

  //actual benchmark loop
  for (int n = n_start; n <= n_end; n += n_step) {
	
	//"progress bar"
    std::cout << "Running Quicksort with n: " << n << std::endl;

	n_avg = 0;

	for (int i = 0; i < 10; i++)
	{
		//generate n random integers
		sorting::randomizeVector(V, n);

		//start measurement
		dtime = omp_get_wtime();

		//execzute sorting algorithm
		sorting::QuickSort(V, 0, V.size() - 1);

		//stop time
		dtime = omp_get_wtime() - dtime;
		n_avg += dtime;
	}
	n_avg *= 0.1;

	//write to file
    quicksort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
  }

  //close file handle
  quicksort_measurement.close();
}

void benchmark_hybridquicksort()
{

	//file stream
	ofstream quicksort_measurement;
	quicksort_measurement.open("hybridquicksort.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Hybrid Quicksort with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::HybridQuickSort(V, 0, V.size() - 1);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}
		n_avg *= 0.1;

		//write to file
		quicksort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	quicksort_measurement.close();
}

void benchmark_mergesort()
{
	//file stream
	ofstream mergesort_measurement;
	mergesort_measurement.open("mergesort.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> a;
	vector<int> b;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Mergesort with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(a, n);
			sorting::randomizeVector(b, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::MergeSort(a, b, 0, a.size() - 1);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;

		//write to file
		mergesort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	mergesort_measurement.close();
}

void benchmark_natmergesort()
{
	//file stream
	ofstream natmergesort_measurement;
	natmergesort_measurement.open("natmergesort.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> a;
	vector<int> b;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Natural Mergesort with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(a, n);
			sorting::randomizeVector(b, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::natMergeSort(a, b);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;

		//write to file
		natmergesort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	natmergesort_measurement.close();
}

void benchmark_heapsort()
{
	//file stream
	ofstream heapsort_measurement;
	heapsort_measurement.open("heapsort.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Heapsort with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::HeapSort(V, V.size() - 1);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;

		//write to file
		heapsort_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	heapsort_measurement.close();
}

void benchmark_shellsort_2n()
{
	//file stream
	ofstream shellsort2n_measurement;
	shellsort2n_measurement.open("shellsort2n.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Shellsort(2n) with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::ShellSort_2n(V, n);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;

		//write to file
		shellsort2n_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	shellsort2n_measurement.close();
}

void benchmark_shellsort_3n()
{
	//file stream
	ofstream shellsort3n_measurement;
	shellsort3n_measurement.open("shellsort3n.txt", ios::out | ios::app);

	//benchmark parameters / variables
	double dtime;
	double n_avg = 0;
	int n_start = 1000;
	int n_step = 1000;
	int n_end = 1000000;

	vector<int> V;

	//actual benchmark loop
	for (int n = n_start; n <= n_end; n += n_step) {

		//"progress bar"
		std::cout << "Running Shellsort(3n) with n: " << n << std::endl;

		n_avg = 0;

		for (int i = 0; i < 10; i++)
		{
			//generate n random integers
			sorting::randomizeVector(V, n);

			//start measurement
			dtime = omp_get_wtime();

			//execzute sorting algorithm
			sorting::ShellSort_3n(V, n);

			//stop time
			dtime = omp_get_wtime() - dtime;
			n_avg += dtime;
		}

		n_avg *= 0.1;
		//write to file
		shellsort3n_measurement << n << "\t" << setprecision(10) << scientific << n_avg << endl;
	}

	//close file handle
	shellsort3n_measurement.close();
}


void benchmark(){ //nedei bara

	//benchmark_quicksort_low();
	//benchmark_insertionsort();

	//benchmark_quicksort();
	//benchmark_hybridquicksort();
	//benchmark_mergesort();
	//benchmark_natmergesort();
	//benchmark_heapsort();
	//benchmark_shellsort_2n();
	//benchmark_shellsort_3n();
}

void A426()
{
	int st;
	double coeff = 0.6;
	cout << "0 - lin. Sondieren" << endl
		<< "1 - quadr. Sondieren" << endl
		<< "2 - dopp. Hashing" << endl << endl;
	cout << "Ihre Kollisionsstrategie (-1 = exit) ?> "; cin >> st;

	if (st == -1) 
		return;

	cout << "Belegungsfaktor ?> "; cin >> coeff;

	HashTable HTable(10, coeff);
	HTable.setStrategy(st);

	int val = 0;
	while (val > 0)
	{
		cout << "Your value (-1 = exit): "; cin >> val;
		if (val < 0)
			exit(0);

		HTable.insert(val);
	}
}

int random(int min, int max)
{
	static bool first = true;
	if (first)
	{
		srand(time(NULL)); 
		first = false;
	}
	return min + rand() % (max + 1 - min);
	//return min + rand() % ((max - min) + 1);
}

void A427()
{
	HashTable HTable(1000);
	for (int i = 0; i < 200; i++) // mit 200 random Werte zw. 1000 und 1500
	{
		//int r = random(1000, 1500);
		HTable.insert(random(1000, 1500));
	}
	cout << "Collision count: " << HTable.getCollisionCount() << endl;
}

int main(int argc, char** argv) {

	int a;
	cout << "(1) Testcases" << '\n' 
		<< "(2) Benchmark" << '\n' 
		<< "(3) Aufgabe 4.2.6" << '\n' 
		<< "(4) Aufgabe 4.2.7" << '\n' 
		<< "(0) Exit" << '\n' << '\n';
	cout << "Welche Aufgabe ?> "; cin >> a; cout << '\n';

	switch (a)
	{
	case 1:
		//Catch::Session().run();
		break;
	case 2:
		std::cout << "\nPress Enter to run measurement" << std::endl;
		std::cin.get();
		system("pause");

		benchmark();
		break;
	case 3:
		A426();
		break;
	case 4:
		A427();
		break;
	default:
		break;
	}
}










