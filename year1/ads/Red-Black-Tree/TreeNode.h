#pragma once
#include <string>
using namespace std;

class TreeNode
{

private:
    int NodeOrderID;
    int NodeChronologicalID;
    string Name;
    int Age;
    double Income;
    int PostCode;
    bool red;
    TreeNode *left, *right, *parent;
public:
    TreeNode(int oID, int chrID, string n, int a, double inc, int pcode) : NodeOrderID{ oID = a + inc + pcode },
                                                                           NodeChronologicalID{ chrID }, 
                                                                           Name{ n }, 
                                                                           Age{ a },                                               
                                                                           Income{ inc }, 
                                                                           PostCode{ pcode }, 
                                                                           red{ true }, 
                                                                           left{ nullptr }, 
                                                                           right{ nullptr }, 
                                                                           parent{ nullptr } {}

    int getNodeOrderID(void) const { return NodeOrderID; }
    int getNodeChronologicalID(void) const { return NodeChronologicalID; }
    std::string getName(void) const { return Name; }
    int getAge(void) const { return Age; }
    double getIncome(void) const { return Income; }
    int getPostCode(void) const { return PostCode; }
    TreeNode* getLeft(void) const { return left; }
    TreeNode* getRight(void) const { return right; }
    TreeNode* getParent(void) const { return parent; }
    bool getRed(void) const { return red; }

    void setNodeOrderID(int a, int pcode, double inc) { NodeOrderID = a + pcode + inc; }
    void setNodeChronologicalID(int chrID) { NodeChronologicalID = chrID; }
    void setName(std::string n) { Name = n; }
    void setAge(int a) { Age = a; }
    void setIncome(double i) { Income = i; }
    void setPostCode(double pcode) { PostCode = pcode; }
    void setLeft(TreeNode* l) { left = l; }
    void setRight(TreeNode* r) { right = r; }
    void setParent(TreeNode* p) { parent = p; }
    void setRed(bool status) { red = status; }

    void print();
    void print_LO();
};
