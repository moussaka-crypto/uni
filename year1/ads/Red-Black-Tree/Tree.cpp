#include "Tree.h"
#include "TreeNode.h"
#include <iomanip>
#include <iostream>
using std::cout;

// Post-Order-Traversierung
void Tree::deleteTree(TreeNode* n) {

	if (n->getLeft()) {

		deleteTree(n->getLeft());
		n->setLeft(nullptr);
	}
	else if (n->getRight()) {

		deleteTree(n->getRight());
		n->setRight(nullptr);
	}
	else if (!n->getLeft() && !n->getRight())
	{
		delete n;
		return;
	}
}

void Tree::balance(TreeNode* n) {
	TreeNode* tmp = n;
	TreeNode* curr = n;
	TreeNode* parent, * grandParent;


	// Bottom-Up bis zur Wurzel
	while (tmp) {
		curr = tmp;
		parent = curr->getParent();
		// currentNode ist Wurzel
		if (!parent) {
			break;
		}
		grandParent = parent->getParent();

		if (curr->getRed()) {
			if (!grandParent || !parent->getRed()) { // parent ist Wurzel oder parent ist schwarz

				tmp = tmp->getParent();
				continue;
			}

			if (grandParent->getRight() == parent) {
				if (parent->getRight() == curr) { // Kein Knick

					rotateTreeLeft(grandParent, parent);
					parent->setRed(0);
					grandParent->setRed(1);
				}
				if (parent->getLeft() == curr) { // Knick - Rechtslinks 

					rotateTreeRight(parent, curr);
					rotateTreeLeft(grandParent, curr);
					curr->setRed(0);
					grandParent->setRed(1);
				}
				tmp = tmp->getParent();
				continue;
			}

			if (grandParent->getLeft() == parent) { //analog
				if (parent->getLeft() == curr) { // Kein Knick

					rotateTreeRight(grandParent, parent);
					parent->setRed(0);
					grandParent->setRed(1);
				}
				if (parent->getRight() == curr) { // Knick - Linksrechts

					rotateTreeLeft(parent, curr);
					rotateTreeRight(grandParent, curr);
					curr->setRed(0);
					grandParent->setRed(1);
				}
				tmp = tmp->getParent();
				continue;
			}
		}
		if (!curr->getRed()) {
			tmp = tmp->getParent();
		}
	}
	// Wurzel muss Schwarz
	curr->setRed(false);
}

bool Tree::split4Node(TreeNode* k) {
	// k ist schwarz
	if (!k->getRed() && 
		k->getLeft() && 
		k->getRight()) {

		if (k->getLeft()->getRed() && 
			k->getRight()->getRed()) {

			k->getLeft()->setRed(0); //nur umgefaerbt
			k->getRight()->setRed(0);
			k->setRed(1);
			return true;
		}
	}
	return false;
}

bool Tree::rotateTreeRight(TreeNode* k1, TreeNode* k2) {
	TreeNode* parent = k1->getParent();

	if (!parent) {
		anker = k2;

		k1->setLeft(k2->getRight());
		k1->setParent(k2);
		if (k2->getRight())
		{
			k2->getRight()->setParent(k1);
		}
		k2->setRight(k1);

		k2->setParent(nullptr);
	}
	else {
		if (parent->getRight() == k1) {
			parent->setRight(k2);
		}
		else {
			parent->setLeft(k2);
		}

		k1->setLeft(k2->getRight());
		k1->setParent(k2);
		if (k2->getRight())
		{
			k2->getRight()->setParent(k1);
		}
		k2->setRight(k1);

		k2->setParent(parent);
	}
	return true;
}

bool Tree::rotateTreeLeft(TreeNode* k1, TreeNode* k2) {

	TreeNode* parent = k1->getParent();

	if (!parent) {
		anker = k2;

		k1->setRight(k2->getLeft());
		k1->setParent(k2);
		if (k2->getLeft())
		{
			k2->getLeft()->setParent(k1);
		}
		k2->setLeft(k1);

		k2->setParent(nullptr);
	}
	else {
		if (parent->getRight() == k1) {
			parent->setRight(k2);
		}
		else {
			parent->setLeft(k2);
		}

		k1->setRight(k2->getLeft());
		k1->setParent(k2);
		if (k2->getLeft())
		{
			k2->getLeft()->setParent(k1);
		}
		k2->setLeft(k1);

		k2->setParent(parent);
	}
	return true;
}

bool Tree::addNode(string name, int age, double income, int postCode) {

	double newNodeOrderID = age + income + postCode;
	TreeNode* newNode = new TreeNode(newNodeOrderID, currentNodeChronologicalID++, name, age, income, postCode);

	// Baum leer
	if (!anker) {
		newNode->setRed(false);
		anker = newNode;
		return true;
	}

	TreeNode* curr = anker; // Hilfsptr
	TreeNode* tmp = anker;
	
	while (tmp) {

		curr = tmp;
		split4Node(curr);

		if (newNodeOrderID < tmp->getNodeOrderID()) {
			tmp = tmp->getLeft();
		}
		else { // >=
			tmp = tmp->getRight();
		}
	}

	// Hinzuf�gen des neuen Knotens als Blatt
	newNode->setParent(curr);
	if (newNodeOrderID < curr->getNodeOrderID()) {

		curr->setLeft(newNode);
	}
	else {  // >=
		curr->setRight(newNode);
	}

	// Bottom-Up entlang des Suchpfades
	balance(newNode);
	return this->proofRBCriterion();
}

int Tree::proofRBCriterion(TreeNode* n) {
	// Post-Order
	if (!n) {
		return -1; // Baum ist leer
	}
	int leftH = proofRBCriterion(n->getLeft());
	int rightH = proofRBCriterion(n->getRight());

	TreeNode* left = n->getLeft();
	TreeNode* right = n->getRight();
	int height;

	if (!left && !right) {
		return 0;
	}
	else if (left && right)
	{
		if (left->getRed() && 
			right->getRed()) { 
			
			height = leftH; //egal
			return height;
		}
		else if (!left->getRed() && !right->getRed()) {
			// H�he der schwarzen Knoten muss gleich 
			if (leftH != rightH) {
				return -1;
			}
			height = leftH + 1; //+Wurzel
			return height;
		}
		else if (!left->getRed() && right->getRed()) { // left schwarz und right rot

			height = leftH + 1;
			if (height != rightH) {
				return -1;
			}
			return height;
		}
		if (left->getRed() && !right->getRed()) { // left rot und right schwarz
			
			height = rightH + 1;
			if (height != leftH) {
				return -1;
			}
			return height;
		}
	}
	else if (left && !right) {

		if (!left->getRed()) {
			height = leftH + 1;
			return height;
		}
		else {
			height = leftH;
			return height;
		}
	}
	else if (!left && right) {

		if (!right->getRed()) {
			height = rightH + 1;
			return height;
		}
		else {
			height = rightH;
			return height;
		}
	}
}

bool Tree::proofRBCriterion() {

	int output = proofRBCriterion(anker);
	return (output == -1) ? false : true;
}

// Pre Order
void Tree::printAll() {

	TreeNode* node = anker;

	cout << "\n";
	cout << "ID  | Name             | Age   | Income    | PostCode | OrderID" << endl;
	cout << "----+------------------+-------+-----------+----------+--------" << endl;
	printPreOrder(node);
}

void Tree::printLevelOrder() {
	// Nur f�r Schwarze Knoten mit den entsprechenden Niveau
	queue<TreeNode*> nodeQ;
	queue<int> lvlQ;

	TreeNode* node = anker;
	if (!node) {
		return;
	}

	levelOrder(); // fur RS Baum Tabelle

	// Wurzelknoten und Startniveau in Queue pushen
	nodeQ.push(node);
	lvlQ.push(0);

	int level = -1;

	cout << endl << "Ausgabe in Levelorder als 234-Baum:";
	while (!nodeQ.empty()) {
		// Entnahme aus der Queue und l�schen
		TreeNode* curr = nodeQ.front();
		nodeQ.pop();
		int newLevel = lvlQ.front();
		lvlQ.pop();

		string output = "("; //234 Baum

		if (newLevel != level) {
			cout <<endl<< "Niveau " << newLevel << ": ";
			level = newLevel;
		}

		if (curr->getLeft()) {
			if (curr->getLeft()->getRed()) {

				output = output + to_string(curr->getLeft()->getNodeOrderID()) + ", ";

				if (curr->getLeft()->getLeft()) {			//Nachfolger von rot auf jeden Fall schwarz
					nodeQ.push(curr->getLeft()->getLeft());
					lvlQ.push(newLevel + 1);
				}
				if (curr->getLeft()->getRight()) {
					nodeQ.push(curr->getLeft()->getRight());
					lvlQ.push(newLevel + 1);
				}
			}
			if (!curr->getLeft()->getRed()) {
				nodeQ.push(curr->getLeft());
				lvlQ.push(newLevel + 1);
			}
		}
		output += to_string(curr->getNodeOrderID());

		if (curr->getRight()) {
			if (curr->getRight()->getRed()) {

				output = output + ", " + to_string(curr->getRight()->getNodeOrderID());

				if (curr->getRight()->getLeft()) {
					nodeQ.push(curr->getRight()->getLeft());
					lvlQ.push(newLevel + 1);
				}
				if (curr->getRight()->getRight()) {
					nodeQ.push(curr->getRight()->getRight());
					lvlQ.push(newLevel + 1);
				}
			}
			if (!curr->getRight()->getRed()) {
				nodeQ.push(curr->getRight());
				lvlQ.push(newLevel + 1);
			}
		}
		output += ") ";
		cout << output/* << endl*/;
	}
	cout << endl;
}

void Tree::levelOrder() { 

	cout << endl << "Ausgabe in Levelorder als binaerer Suchbaum:" << endl;
	cout << '\n';
	cout << "ID  | Name             | Age   | Income    | PostCode | Pos   | Level | Red " << endl;
	cout << "----+------------------+-------+-----------+----------+-------+-------+-----" << endl;

	TreeNode* node = anker;

	std::queue<TreeNode*> q;
	std::queue<int> nq;

	if (!node)
		return;

	// Wurzelknoten und Startniveau in die Queues pushen
	q.push(node);
	nq.push(0);

	int level;

	while (!q.empty()) {
		// Entnahme aus den Queues und l�schen 
		TreeNode* curr = q.front();
		q.pop();
		level = nq.front();
		nq.pop();

		curr->print_LO();
		cout << setw(7) << level << "|"
			<< setw(2) << curr->getRed() << endl;

		// Linker Nachfolgeknoten in die Queues
		if (curr->getLeft())
		{
			q.push(curr->getLeft());
			nq.push(level + 1);
		}
		// Rechter Nachfolgeknoten in die Queues
		if (curr->getRight())
		{
			q.push(curr->getRight());
			nq.push(level + 1);
		}
	}
	return;
}

void Tree::printLevelOrder(int l) {
	// Nur f�r Schwarze Knoten mit den entsprechenden Niveau
	queue<TreeNode*> nodeQ;
	queue<int> lvlQ;

	TreeNode* node = anker;
	if (!node) return;

	// Wurzelknoten und Startniveau in Queue pushen
	nodeQ.push(node);
	lvlQ.push(0);

	int level = -1;

	while (!nodeQ.empty()) {
		// Entnahme aus der Queue und l�schen
		TreeNode* curr = nodeQ.front();
		nodeQ.pop();
		int newLevel = lvlQ.front();
		lvlQ.pop();

		string text = "(";

		if (newLevel != level) {
			if (newLevel == l) {
				cout << "Niv. " << newLevel << ": ";
			};
			level = newLevel;
		}

		if (curr->getLeft()) {
			if (curr->getLeft()->getRed()) {

				text = text + to_string(curr->getLeft()->getNodeOrderID()) + ", ";

				if (curr->getLeft()->getLeft()) {
					nodeQ.push(curr->getLeft()->getLeft());
					lvlQ.push(newLevel + 1);
				}
				if (curr->getLeft()->getRight()) {
					nodeQ.push(curr->getLeft()->getRight());
					lvlQ.push(newLevel + 1);
				}
			}
			if (!curr->getLeft()->getRed()) {
				nodeQ.push(curr->getLeft());
				lvlQ.push(newLevel + 1);
			}
		}
		text += to_string(curr->getNodeOrderID());
		if (curr->getRight()) {
			if (curr->getRight()->getRed()) {

				text = text + ", " + to_string(curr->getRight()->getNodeOrderID());

				if (curr->getRight()->getLeft()) {
					nodeQ.push(curr->getRight()->getLeft());
					lvlQ.push(newLevel + 1);
				}
				if (curr->getRight()->getRight()) {
					nodeQ.push(curr->getRight()->getRight());
					lvlQ.push(newLevel + 1);
				}
			}
			if (!curr->getRight()->getRed()) {
				nodeQ.push(curr->getRight());
				lvlQ.push(newLevel + 1);
			}
		}
		text += ") ";
		if (newLevel == l) {
			cout << text;
		}
	}
	cout << endl;
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
// |
// |
// |
//Search
bool Tree::searchNode(std::string name)
{
	return preOrderFind(this->anker, name);
}

void Tree::printPreOrder(TreeNode* n) {
	if (n) {
		cout << setfill(' ');
		cout << setw(4) << n->getNodeChronologicalID() << "|" <<
			setw(18) << n->getName() << "|" <<
			setw(7) << n->getAge() << "|" <<
			setw(11) << n->getIncome() << "|" <<
			setw(10) << n->getPostCode() << "|" <<
			setw(7) << n->getNodeOrderID() << "|" << endl;

		printPreOrder(n->getLeft());
		printPreOrder(n->getRight());
	}
}