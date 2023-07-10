#pragma once
#include "TreeNode.h"
#include "catch.h"
#include <string>

class Tree
{

private:
    TreeNode* anker;
    int currentNodeChronologicalID;

    //Destruktor Hilfsfkt
    void deleteBST(TreeNode* anker);

    // Suchmethode Hilfsfkt
    bool preOrderFind(TreeNode* node, string name);
    bool preOrderPrint(TreeNode* node);
public:
    Tree() : currentNodeChronologicalID{ 0 }, anker{ nullptr } {}
    ~Tree() { deleteBST(anker); }

    void addNode(std::string name, int age, double income, int postcode);
    bool deleteNode(int oID);
    bool searchNode(std::string name);
    void printAll(void);
    void levelOrder(void);

    int get_currentNodeID() const { return currentNodeChronologicalID; }
    friend TreeNode* get_anker(Tree& TN);
};
