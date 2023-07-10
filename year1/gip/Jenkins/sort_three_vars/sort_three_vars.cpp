#include "sort_three_vars.h"
#include <string>

template <typename T> 
void sort_three_vars(T& x1, T& x2, T& x3) {
	int counter = 3;
	T tmp;
	T array[3];
	//Array befüllen
	array[0] = x1;
	array[1] = x2; //tyka slagame trite Variableta v array-a
	array[2] = x3;

	//Bubble Sort algorithmus - pederastiq malko

	for (int y = 0; y < counter; y++)
	{
		for (int i = 0; i < counter - 1; i++)
		{
			if (array[i] > array[i + 1])
			{
				tmp = array[i]; 
				array[i] = array[i + 1];
				array[i + 1] = tmp;
			}
		}
	}

	x1 = array[0];
	x2 = array[1]; //tyka slagame na koe mqsto ot areq se namirat
	x3 = array[2];
}

template void sort_three_vars<int>(int& x1, int& x2, int& x3);
template void sort_three_vars<std::string>(std::string& x1, std::string& x2, std::string& x3);