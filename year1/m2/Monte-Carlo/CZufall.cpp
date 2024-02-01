#include "CZufall.h"

int CZufall::wert(int a, int b)
{
    return a + rand() % ((b + 1) - a);
}

void CZufall::initialisiere(int s)
{
    srand(s);
}

std::vector<int> CZufall::test(int a, int b, int N) //müssen Vektoren zurückgeben
{
    std::vector<int> ergebnisse;
    ergebnisse.resize(b - a + 1);

    for (int i = 0; i < N; i++)
    {
        ergebnisse[wert(a, b) - a] += 1;
    }
    
    return ergebnisse;
}

std::vector<int> CZufall::test_falsch(int a, int b, int N)
{
    std::vector<int> ergebnisse;
    ergebnisse.resize(b - a + 1);

    for (int i = 0; i < N; i++)
    {
        initialisiere((int)time(NULL));
        ergebnisse[wert(a, b) - a] += 1;
    }
    return ergebnisse;
}