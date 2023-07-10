#include "CKomplex.h"

vector<CKomplex>  werte_einlesen(const std::string dateiname)
{
	int i, N, idx;// N= letzter datenpunkte  
	double re, im;
	vector<CKomplex> werte;
	ifstream fp;
	fp.open(dateiname);
	// Dimension einlesen
	fp >> N;
	// Werte-Vektor anlegen
	werte.resize(N);
	CKomplex null(0, 0);
	for (i = 0; i < N; i++)
		werte[i] = null;
	// Eintraege einlesen und im Werte-Vektor ablegen
	while (!fp.eof())
	{
		fp >> idx >> re >> im;
		CKomplex a(re, im);
		werte[idx] = a;
	}
	// File schliessen
	fp.close();

	return werte;
}
void werte_ausgeben(const std::string dateiname, vector<CKomplex> werte, double epsilon = -1.0)
{
	int i;
	const size_t N = werte.size();
	// File oeffnen
	ofstream fp;
	fp.open(dateiname);
	// Dimension in das File schreiben
	fp << N << endl;
	// Eintraege in das File schreiben
	fp.precision(10);
	for (i = 0; i < N; i++)
		if (werte[i].abs() > epsilon)
			fp << i << "\t" << werte[i].re() << "\t" << werte[i].im() << endl;
	// File schliessen
	fp.close();
}

// Cooley–Tukey FFT (in-place, divide-and-conquer)
// Higher memory requirements and redundancy although more intuitive
typedef std::complex<double> Complex;
typedef std::valarray<Complex> CArray;
void fft(CArray& x)
{
	const size_t N = x.size();
	if (N <= 1) 
		return;

	// divide
	CArray even = x[slice(0, N / 2, 2)];
	CArray odd = x[slice(1, N / 2, 2)];

	// conquer
	fft(even);
	fft(odd);

	// combine
	for (size_t k = 0; k < N / 2; ++k)
	{
		Complex t = polar(1.0, -2 * M_PI * k / N) * odd[k];
		x[k] = even[k] + t;
		x[k + N / 2] = even[k] - t;
	}
}

void ifft(CArray& x)
{
	// conjugate the complex numbers
	x = x.apply(std::conj);

	// forward fft
	fft(x);

	// conjugate the complex numbers again
	x = x.apply(std::conj);

	// scale the numbers
	x /= x.size();
}

int main() {
	vector<CKomplex> hinT, rckT;
	vector<CKomplex> f = werte_einlesen("Daten_original.txt");

	//Hintransformation für alle Epsilon
	hinT = fourier(f, 1);
	werte_ausgeben("Hintransformation_Default.txt", hinT);
	werte_ausgeben("Hintransformation_0001.txt", hinT, 0.001);
	werte_ausgeben("Hintransformation_001.txt", hinT, 0.01);
	werte_ausgeben("Hintransformation_01.txt", hinT, 0.1);
	werte_ausgeben("Hintransformation_10.txt", hinT, 1.0);

	////////////////////////////////////////////////////////////////////////////////////////////// Standard-Epsilon -1.0
	rckT = werte_einlesen("Hintransformation_Default.txt");
	// Rücktransformation
	rckT = fourier(rckT, 0);
	werte_ausgeben("Ruecktransformation_Default.txt", rckT);

	double max = abweichung(f, rckT);
	cout << "Maximale Abweichung bei Standard-Epsilon (-1.0) : " << max << endl;
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////////////////////////////// Epsilon = 0.001
	rckT = werte_einlesen("Hintransformation_0001.txt");
	rckT = fourier(rckT, 0);
	werte_ausgeben("Ruecktransformation_0001.txt", rckT, 0.001);

	max = abweichung(f, rckT);
	cout << "Maximale Abweichung bei Epsilon (0.001) : " << max << endl;
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////////////////////////////// Epsilon = 0.01
	rckT = werte_einlesen("Hintransformation_001.txt");
	rckT = fourier(rckT, 0);
	werte_ausgeben("Ruecktransformation_001.txt", rckT, 0.01);

	max = abweichung(f, rckT);
	cout << "Maximale Abweichung bei Epsilon (0.01) : " << max << endl;
	//////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////// Epsilon = 0.1
	rckT = werte_einlesen("Hintransformation_01.txt");
	rckT = fourier(rckT, 0);
	werte_ausgeben("Ruecktransformation_01.txt", rckT, 0.1);

	max = abweichung(f, rckT);
	cout << "Maximale Abweichung bei Epsilon (0.1): " << max << endl;
	//////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////// Epsilon = 1.0
	rckT = werte_einlesen("Hintransformation_10.txt");
	rckT = fourier(rckT, 0);
	werte_ausgeben("Ruecktransformation_10.txt", rckT, 1.0);

	max = abweichung(f, rckT);
	cout << "Maximale Abweichung bei Epsilon (1.0): " << max << endl << endl; system("pause");
	//////////////////////////////////////////////////////////////////////////////////////////////

	const Complex test[] = { 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0 };
	CArray data(test, 8);

	// forward fft
	fft(data);

	std::cout << "fft" << std::endl;
	for (int i = 0; i < 8; ++i)
	{
		std::cout << data[i] << std::endl;
	}

	// inverse fft
	ifft(data);

	std::cout << std::endl << "ifft" << std::endl;
	for (int i = 0; i < 8; ++i)
	{
		std::cout << data[i] << std::endl;
	}

	system("PAUSE");
	return 0;
}