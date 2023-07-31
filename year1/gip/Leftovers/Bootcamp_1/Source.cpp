#include <iostream>
using namespace std;

void add2(int a) {
    a = a + 2;
}

int main()
{
    int a = 6;
    add2(a);
    //a => 6
    cout << a;

    system("pause");
    return 0;
}