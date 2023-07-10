#ifndef _SORTING_H_
#define _SORTING_H_
#include <vector>
#include <iostream>
#include <string>
using std::vector;

namespace sorting {
  void QuickSort(vector<int> &arr, int left, int right);
  void InsertionSort(vector<int>& arr, int n);
  void HybridQuickSort(vector<int>& arr, int left, int right);

  void Merge(vector<int> &a, vector<int> &b,int low, int pivot, int high);
  void MergeSort(vector<int> &a, vector<int> &b, int low, int high);

  void natMerge(vector<int>& a, vector<int>& b, int low, int pivot, int high);
  void natMergeSort(vector<int> &a, vector<int> &b);

  void HeapSort(vector<int> &a, int n);

  void ShellSort_2n(vector<int> &a, int n); // hibbard: h = 2h+1
  void ShellSort_3n(vector<int> &a, int n); // h = 3h+1

  void randomizeVector(vector<int> &array, int n);
}
#endif