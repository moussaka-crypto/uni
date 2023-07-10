#include "TreeNode.h"
#include <iostream>
#include <iomanip>
#include <string>

void TreeNode::print()
{
	cout << setfill(' ');
	cout << setw(4) << getNodeChronologicalID() << "|" <<
		setw(18) << getName() << "|" <<
		setw(7) << getAge() << "|" <<
		setw(11) << getIncome() << "|" <<
		setw(11) << getPostCode() << "|" <<
		setw(11) << getNodeOrderID() << "|" << endl;
}

void TreeNode::print_LO() {

	cout << setfill(' ');
	cout << setw(4) << getNodeChronologicalID() << "|" <<
		setw(18) << getName() << "|" <<
		setw(7) << getAge() << "|" <<
		setw(11) << getIncome() << "|" <<
		setw(10) << getPostCode() << "|" <<
		setw(7) << getNodeOrderID() << "|";
}
