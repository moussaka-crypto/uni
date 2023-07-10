//#define CATCH_CONFIG_RUNNER
#include "Tree.h"
//#include "catch.h"
#include <iostream>

using namespace std;



/*
Importiert CSV Datei in bestehenden Baum.
Bei Aufruf in der main() Methode, muss der Pointer auf den Anker des Baums, als Parameter �bergeben werden.
Es wird die im gleichen Verzeichnis liegende Datei "ExportZielanalyse.csv" geladen.
****************************/
void mainscreen_addTreeCSV(Tree*& ref)
{
    char j;
    cout << "+ Moechten Sie die Daten aus der Datei ExportZielanalyse.csv "
        "importieren(j / n) ?> ";
    cin >> j;
    if (j == 'j')
    {
        ifstream csvread;
        csvread.open("ExportZielanalyse.csv", ios::in);
        if (!csvread.is_open())
            cerr << "Fehler beim Lesen!" << endl;
        else
        {
            string name, age, postcode, income;

            while (!csvread.eof())
            {
                getline(csvread, name, ';');
                getline(csvread, age, ';');
                getline(csvread, income, ';');
                getline(csvread, postcode, '\n');
                ref->addNode(name, stoi(age), stod(income), stoi(postcode));
            }
            csvread.close();
        }
        cout << "+ Daten wurden dem Baum hinzugefuegt." << endl;
    }
}


void clearInput() {
    cin.clear();
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
}

void UI() {

    Tree b;
    Tree* bptr = &b;

    int input = 0;
    string name = "";
    int age = 0, plz = 0;
    double income = 0;

    cout << "=========================================" << endl;
    cout << "ADS-ELK-Stack v1.8, by Bhay Sanon" << endl;
    cout << "=========================================" << endl;

    do {
        cout << "1) Datensatz einfuegen, manuell" << endl;
        cout << "2) Datensatz einfuegen, CSV Datei" << endl;
        cout << "3) Suchen" << endl;
        cout << "4) Ausgabe in Preorder" << endl;
        cout << "5) Ausgabe in Levelorder" << endl;
        cout << "6) Ausgabe in Levelorder (mit Niveauauswahl)" << endl;
        cout << "7) Exit" << endl;

        cout << "?> ";
        try {
            cin >> input;
            if (input < 1 || input > 7)
                throw input;
        }
        catch (...) {
            cout << "Ungueltige Eingabe." << endl;
            clearInput();
        }
        cout << endl;

        switch (input)
        {
        case 1:
            cout << "+ Bitte geben Sie den neuen Datensatz ein:" << endl;
            cout << "Name ?> "; getline(cin >> ws, name);
            cout << "Alter ?> "; cin >> age;
            cout << "Einkommen ?> "; cin >> income;
            cout << "PLZ ?> "; cin >> plz;
            if (b.addNode(name, age, income, plz))
                cout << endl << "+ Ihr Datensatz wurde eingefuegt" << endl << endl;
            break;

        case 2:
            //mainscreen_addTreeCSV(bptr);
            break;
        case 3:
            cout << "+ Bitte geben Sie den zu suchenden Datensatz an" << endl;
            cout << " Name ?> "; getline(cin >> ws, name);

            if (!b.searchNode(name))
                cout << "////Node not found.////" << endl << endl;
            break;
        case 4:
            b.printAll();
            break;
        case 5:
            b.printLevelOrder();
            break;
        case 6:
            int i; cout << "Niveau (im 234-Baum) ?> "; cin >> i;
            b.printLevelOrder(i);
            break;
        }
    } while (input != 7);
}

int main()
{
    //int result = Catch::Session().run();
    UI();
    system("PAUSE");

    return 0;
}
