#include "Tree.h"
#include "TreeNode.h"
#include <iomanip>
#include <iostream>
#include <queue>
using namespace std;

//Destruktor Hilfsfkt
void Tree::deleteBST(TreeNode* node) // Methode des Destruktors
{
	if (node) {
		deleteBST(node->getLeft());
		deleteBST(node->getRight());
		delete node;
	}
}

void Tree::addNode(std::string name, int age, double income, int postcode)
{
	int orderID = age + income + int(postcode);
	int ID = get_currentNodeID();

	TreeNode* newNode = new TreeNode(orderID, ID, name, age, income, postcode);

	if (!anker) {
		anker = newNode;
	}
		
	else {
		TreeNode* p = anker, * seeker = anker;
		while (seeker) { //bis zur Einfuegepos gehen

			p = seeker;

			if (newNode->getNodeOrderID() < seeker->getNodeOrderID())
				seeker = seeker->getLeft();
			else
				seeker = seeker->getRight();
		}

		if (newNode->getNodeOrderID() < p->getNodeOrderID())
			p->setLeft(newNode);
		else
			p->setRight(newNode);
	}
	currentNodeChronologicalID++; return;
	//cout << "+ Ihr Datensatz wurde eingefuegt" << endl; return;
}


//Search Hilfsfkt
bool Tree::preOrderFind(TreeNode* seeker, string name)
{
	if (!seeker)
		return false;
	else {
		bool found = false;
		if (seeker->getName() == name) {

			found = true;
			seeker->print();
		}
		bool found_l = preOrderFind(seeker->getLeft(), name);
		bool found_r = preOrderFind(seeker->getRight(), name);

		return (found || found_l || found_r);
	}
}  

bool Tree::searchNode(std::string name)
{
	return preOrderFind(this->anker, name);
}


//PrintAll Hilfsfkt
bool Tree::preOrderPrint(TreeNode* node)
{
	if (!node)
		return false;

	node->print();

	preOrderPrint(node->getLeft());
	preOrderPrint(node->getRight());
}

void Tree::printAll()
{
	//cout << "////////////////////////////PreOrder Ausgabe - WLR///////////////////////" << endl; system("Pause");
	cout << '\n';
	cout << " ID | Name             | Age   | Income    | PostCode | OrderID" << endl;
	cout << "----+------------------+-------+-----------+----------+-------" << endl;
	preOrderPrint(this->anker);
	cout << "////////////////////////////PreOrder Ausgabe - WLR - Ende //////////////" << endl; cout << endl; system("Pause"); cout << endl;
}

void Tree::levelOrder(void)
{
	//cout << "////////////////////////////LevelOrder Ausgabe/////////////////////////" << endl; system("Pause");
	cout << '\n';
	cout << " ID | Name             | Age   | Income    | PostCode | OrderID | Level" << endl;
	cout << "----+------------------+-------+-----------+----------+---------+------" << endl;

	TreeNode* node = anker;
	queue<TreeNode*> q;
	queue<int> lvl_q;

	if (!node)
		return;

	q.push(node);
	lvl_q.push(1);

	int prev_lvl = -1;
	int level;

	while (!q.empty()) {

		TreeNode* curr = q.front();
		q.pop();

		level = lvl_q.front();
		lvl_q.pop();

		//if (niveau > max_lvl) return;

		if (prev_lvl != level) {
			curr->print_LO();
			cout << level << endl;
		}

		if (curr->getLeft() != nullptr) {
			q.push(curr->getLeft());
			lvl_q.push(level + 1);
		}
		if (curr->getRight() != nullptr) {
			q.push(curr->getRight());
			lvl_q.push(level + 1);
		}
	}
	cout << endl;
	cout << "////////////////////////////LevelOrder Ausgabe - Ende/////////////////" << endl; system("Pause");
	return;
}

bool Tree::deleteNode(int oID)
{
	TreeNode* terminator = anker;
	TreeNode* prev = nullptr;

	TreeNode* hptr1, * hptr2;

	while (terminator != nullptr && oID != terminator->getNodeOrderID()) { // Zu loeschenden Element suchen

		prev = terminator;
		
		if (oID < terminator->getNodeOrderID())
			terminator = terminator->getLeft();
		else
			terminator = terminator->getRight();
	}

	if (!terminator) {
		wcerr << "Error: Element nicht im Baum enthalten." << endl; exit(0);
	}

	if (terminator->getLeft() == nullptr && terminator->getRight() == nullptr) { // 0 Nachfolger
		hptr2 = nullptr;
	}
	else if (!(terminator->getLeft() != nullptr && terminator->getRight() != nullptr)) { // 1 Nachfolger

		if (terminator->getLeft() != nullptr)
			hptr2 = terminator->getLeft();
		else
			hptr2 = terminator->getRight();
	}
	else { // 2 Nachfolger

		hptr1 = terminator;
		hptr2 = terminator->getRight();

		while (hptr2->getLeft() != nullptr) { // min des RTBs suchen
			hptr1 = hptr2;
			hptr2 = hptr2->getLeft();
		}
		hptr2->setLeft(terminator->getLeft());

		if (hptr1 != terminator) {
			hptr1->setLeft(hptr2->getRight());
			hptr2->setRight(terminator->getRight());
		}
	}

	if (prev == nullptr)
		anker = hptr2;
	else {
		if (prev->getLeft() == terminator)
			prev->setLeft(hptr2);
		else
			prev->setRight(hptr2);
	}
	delete terminator;
	return true;
}