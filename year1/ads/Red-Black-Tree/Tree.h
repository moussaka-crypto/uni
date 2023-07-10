#pragma once
#include "TreeNode.h"
#include "catch.h"
#include <string>
#include <queue>

class Tree
{
private:
    TreeNode* anker;
    int currentNodeChronologicalID;

    void balance(TreeNode*);
    bool split4Node(TreeNode*);
    int proofRBCriterion(TreeNode*);
    bool rotateTreeRight(TreeNode*, TreeNode*);
    bool rotateTreeLeft(TreeNode*, TreeNode*);

    // ~Tree() Hilfsmeth
    void deleteTree(TreeNode*);

    //searchNode Hilfsmeth
    bool preOrderFind(TreeNode* seeker, string name);

    //printAll() Hilfsmeth
    void printPreOrder(TreeNode*);
public:
    Tree() : anker{nullptr}, currentNodeChronologicalID{0} {}
    ~Tree() { if (anker != nullptr) deleteTree(anker); }

    // void deleteNode(int); //vielleicht morgen
    bool addNode(string, int, double, int);
    bool searchNode(string);
    void printAll();
    void printLevelOrder(); //fuer 234 Baum
    void printLevelOrder(int); //Knoten auf konkretem Niveau im RS Baum als 234 Baum
    void levelOrder(); //fuer RS Baum

    //Hilfsmemthode beim einfuegen und testen
    bool proofRBCriterion();
    friend TreeNode* get_anker(Tree& TN);
};

