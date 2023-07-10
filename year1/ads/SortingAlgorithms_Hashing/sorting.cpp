#include "sorting.h"
using std::swap;

namespace sorting {

	int median3(vector<int>& arr, int left, int right) //VL Code
	{
		int mid = (left + right) / 2;

		if (arr[mid] < arr[left])
			swap(arr[left], arr[mid]);
		if (arr[right] < arr[left])
			swap(arr[left], arr[right]);
		if (arr[right] < arr[mid])
			swap(arr[mid], arr[right]);

		swap(arr[mid], arr[right]);
		return mid; // muss idx sein
	}

	int partition(std::vector<int>& A, int l, int r) //VL Code
	{
		int pivot = A[r];
		int i = l - 1;
		for (int j = l; j < r; j++)
		{
			if (A[j] <= pivot) {
				i++;
				std::swap(A[i], A[j]);
			}
		}
		std::swap(A[i + 1], A[r]);
		return i + 1;
	}

	void QuickSort(vector<int>& arr, int left, int right)// VL
	{
		if (left >= right)
			return;

		int pi = partition(arr, left, right);
		QuickSort(arr, left, pi - 1);
		QuickSort(arr, pi + 1, right);
	}

	void InsertionSort(vector<int>& arr, int n)
	{
		for (int i = 1; i < n; i++)
		{
			int key = arr[i];
			int j = i - 1;
			while (j >= 0 && arr[j] > key)
			{
				arr[j + 1] = arr[j];
				j--;
			}
			arr[j + 1] = key;
		}
	}

	void HybridQuickSort(vector<int>& arr, int left, int right)
	{
		if (left < right)
		{
			if (right - left + 1 >= 300) // 300 ist n0 CrossOver Point
			{
				int mid = median3(arr, left, right);
				std::swap(arr[mid], arr[right]);
				int pi = partition(arr, left, mid);
				HybridQuickSort(arr, left, pi - 1);
				HybridQuickSort(arr, pi + 1, right);
			}
			else
				InsertionSort(arr, right - left + 1);
		}
	}

	void Merge(vector<int>& a, vector<int>& b, int low, int pivot, int high)
	{
		const int N1 = pivot - low;
		if (high == a.size())
			high--;
		b.resize(high - low + 1);

		for (int i = 0; i < b.size(); i++) // in b unsortierte Werte
			b[i] = a[low + i];

		int i = 0, j = N1 + 1, k = low;
		for (k = low; k < high; k++) {

			if (i <= N1 && j <= high - low && b[i] <= b[j])
				a[k] = b[i++];
			else if (j <= high - low)
				a[k] = b[j++];
			else
				break;
		}

		while (i <= N1 && k <= high) //Rest des Arrays a ausf�llen
			a[k++] = b[i++];

		while (j < high - low && k < high)
			a[k++] = b[j++];
	}

	void MergeSort(vector<int>& a, vector<int>& b, int low, int high)
	{
		if (low >= high)
			return;

		int mid = (low + high) / 2;
		MergeSort(a, b, low, mid);
		MergeSort(a, b, mid + 1, high);
		Merge(a, b, low, mid, high);
	}

	void natMerge(vector<int>& a, vector<int>& b, int left, int middle, int right)
	{
		int l = left, r = middle + 1;
		for (int i = left; i <= right; i++)
		{
			if (r > right || (l <= middle && a[l] <= a[r])) //Teilarray ab r
				b[i] = a[l++];

			else if (l > middle || (r <= right && a[r] <= a[l]))// Teilarray ab l
				b[i] = a[r++];
		}

		for (int i = left; i <= right; i++)// Rest der Elemente
			a[i] = b[i];
	}

	void natMergeSort(vector<int>& a, vector<int>& b)
	{
		const size_t N = a.size();
		int left = 0, right = N - 1;
		bool sorted = false;
		int l = left, r = right;

		do {				//Testen ob Teilarray schon vorsortiert - natural!!!
			sorted = true;
			left = 0;
			while (left < right)
			{
				l = left;
				while (l < right && a[l] <= a[l + 1]) //aufsteigend obv
					l++;

				r = l + 1;
				while (/*r == right - 1 ||*/ (r < right && a[r] <= a[r + 1]))
					r++;

				if (r <= right)
				{
					natMerge(a, b, left, l, r);
					sorted = false;
				}
				left = r + 1;
			}
		} while (!sorted);
	}

	int leftChild(int i) { return 2 * i + 1; }

	void percDown(vector<int>& a, int i, int n) { // VL Code
		int child = i;
		int tmp = a[i];
		int j = i;
		while (leftChild(j) < n) {
			child = leftChild(j);
			if (child != (n - 1) && a[child] < a[child + 1]) {
				child++;
			}
			if (tmp < a[child]) {
				swap(a[j], a[child]);
				j = child;
			}
			else {
				break;
			}
		}
	}

	void heapify(vector<int>& a, int i, int n) { //mein Code

		const int left = 2 * i + 1, 
				 right = 2 * i + 2;

		// root und one of the child nodes swapped if child is a new max

		if (right < n && a[right] >= a[left] && a[right] > a[i]) {
			swap(a[right], a[i]);
			heapify(a, right, n);
		}
		else if (right < n && a[left] > a[right] && a[left] > a[i]) {
			swap(a[left], a[i]);
			heapify(a, left, n);	
		}
		else if (left < n && a[left] > a[i]) {
			swap(a[left], a[i]);
			heapify(a, left, n);	
		}

	}

	void HeapSort(vector<int> &a, int n) 
	{
		int i = n / 2;
		while (i >= 0)
		{
			percDown(a,i,n);
			i--;
		}
		int j = n - 1;
		while (j > 0)
		{
			swap(a[0], a[j]);
			percDown(a,0,j);
			j--;
		}
	}

	void ShellSort_2n(vector<int> &a, int n)
	{
		int hibb = 0;
		while (hibb <= n)
			hibb = 2 * hibb + 1; // 2er Potenzen - 1 {1,3,7,15,31,63,...}

		for (auto gap = hibb / 2; gap > 0; gap /= 2)
		{
			for (auto i = gap; i < n; i++) {
				int key = a[i];
				auto j = i;

				for (; j >= gap && key < a[j - gap]; j -= gap)
				{
					a[j] = a[j - gap];
				}
				a[j] = key;
			}
		}
	}


	void ShellSort_3n(vector<int>& a, int n)
	{
		int no_hib = 0;
		while (no_hib <= n)
			no_hib = 3 * no_hib + 1; //{1,4,7,13,40,...}

		for (auto gap = no_hib / 2; gap > 0; gap /= 2)
		{
			for (auto i = gap; i < n; i++) {
				int key = a[i];
				auto j = i;

				for (; j >= gap && key < a[j - gap]; j -= gap)
				{
					a[j] = a[j - gap];
				}
				a[j] = key;
			}
		}
	}


  void randomizeVector(vector<int> &array, int n) {
    array.resize(n);

    for(unsigned int i=0;i<array.size();i++)
      array[i]=rand() % 1000000;
  }
}





