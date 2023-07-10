#include <iostream>
#include <string>
using namespace std;

int main() {
    string sd_hier = ""; //jede neue sudoku zeile wird hier eingelesen
    string eingabe[11] = { "" }; // Zahlen werden hier ersetzt und gespeichert

    int sudoku[9][9] = { 0 }; //2d Array fuer die reine Sudoku Zahlen

    cout << "Bitte geben Sie das Sudoku ein:" << endl;

    string f = ""; //dient zur Tupumwandlung
    int d = 0; //zeile des 2D Arrays

    for (int a = 0; a < 11; a++) //gelesene Zeile des Sudokus
    {
        cin >> sd_hier;

        if (sd_hier.at(1) >= '0' && sd_hier.at(1) <= '9')
        {
            int b = 0; //pos der zahl in eingabe, wird durch c Schleife veraendert
            for (int c = 0; c < sd_hier.length(); c++) //Position des char im Sudoku
            {
                if (sd_hier.at(c) >= '0' && sd_hier.at(c) <= '9')
                {
                    eingabe[b] = sd_hier.at(c);
                    b++;
                }
            }
            for (int e = 0; e < 9; e++) // e ist pos in des symbols in eingabe, wird zu f abgegeben (Typumwandlung)
            {
                f = eingabe[e];
                int g = stoi(f); //Wert konvertiert, zu sudoku zahl uebergegeben
                sudoku[d][e] = g;
            }
            d++;
        }
    }
    cout << endl;


    cout << "Das Sudoku lautet:" << endl; // h ist zeile des sudoku-array, i ist pos der zahl in der zeile

    // die Ausgabe in 3x3 durch for Schleifen verteilen //vielleicht kuerzer machen???

    for (int row = 0; row < 3; row++)
    {
        for (int i = 0; i < 3; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j; // mit j wird der jeweilige Wert von Sudoku ausgegeben
        }

        cout << ";//";

        for (int i = 3; i < 6; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << ";//";

        for (int i = 6; i < 9; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }
        cout << endl;
    }

    cout << "=======//=======//=======" << endl;

    for (int row = 3; row < 6; row++)
    {
        for (int i = 0; i < 3; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << ";//";

        for (int i = 3; i < 6; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << ";//";

        for (int i = 6; i < 9; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }
        cout << endl;
    }

    cout << "=======//=======//=======" << endl;

    for (int row = 6; row < 9; row++)
    {
        for (int i = 0; i < 3; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << ";//";

        for (int i = 3; i < 6; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << ";//";

        for (int i = 6; i < 9; i++)
        {
            int j = sudoku[row][i];
            cout << ";" << j;
        }

        cout << endl;
    }
    system("PAUSE");
    return 0;
}