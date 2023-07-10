#include "TreeNode.h"
#include <iostream>
#include <string>

void TreeNode::print()
{
	cout.left; cout.width(4); cout << NodeChronologicalID; cout << "|";
	cout.right; cout.width(18); cout << Name; cout << "|";
	cout.right; cout.width(7); cout << Age; cout << "|";
	cout.right; cout.width(11); cout << Income; cout << "|";
	cout.right; cout.width(10); cout << PostCode; cout << "|";
	cout.left; cout.width(7); cout << NodeOrderID << endl;
}

void TreeNode::print_LO()
{
	cout.left; cout.width(4); cout << getNodeChronologicalID(); cout << "|";
	cout.right; cout.width(18); cout << getName(); cout << "|";
	cout.right; cout.width(7); cout << getAge(); cout << "|";
	cout.right; cout.width(11); cout << getIncome(); cout << "|";
	cout.right; cout.width(10); cout << getPostCode(); cout << "|";
	cout.left; cout.width(9); cout << getNodeOrderID(); cout << "|";
	cout.right;	cout.width(6);
}