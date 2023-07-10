//#define CATCH_CONFIG_RUNNER
#include "Tree.h"
//#include "catch.h"
#include <iostream>

using namespace std;

///////////////////////////////////////
// Hilfsmethoden f�rs Men� hier:



/*
Importiert CSV Datei in bestehenden Baum.
Bei Aufruf in der main() Methode, muss der Pointer auf den Anker des Baums, als Parameter uebergeben werden.
Es wird die im gleichen Verzeichnis liegende Datei "ExportZielanalyse.csv" geladen.
*/
void mainscreen_addTreeCSV(Tree*& ref)
{
    char j;
    cout << "+ Moechten Sie die Daten aus der Datei ExportZielanalyse.csv "
        "importieren (j / n) ?> ";
    cin >> j;
    if (j == 'j')
    {
        ifstream csvread;
        csvread.open("ExportZielanalyse.csv", ios::in);
        if (!csvread.is_open())
            cout << "Fehler beim Lesen!" << endl;
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
    int oID;
    string name = "";
    int age = 0, plz = 0;
    double income = 0;

    cout << "=========================================" << endl;
	cout << "ADS - ELK - Stack v1.9, by 25th Bam" << endl;
    cout << "=========================================" << endl;

    do {
        cout << "1) Datensatz einfuegen, manuell" << endl;
        cout << "2) Datensatz einfuegen, CSV Datei" << endl;
        cout << "3) Datensatz loeschen" << endl;
        cout << "4) Suchen" << endl;
        cout << "5) Datenstruktur anzeigen" << endl;
        cout << "6) Level-Order Ausgabe" << endl;
        cout << "7) Beenden" << endl;

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
            cout << "+ Bitte geben Sie die den neuen Datensatz ein:" << endl;
            cout << "Name ?> "; getline(cin >> ws, name);
            cout << "Alter ?> "; cin >> age;
            cout << "Einkommen ?> "; cin >> income;
            cout << "PLZ ?> "; cin >> plz;
            b.addNode(name, age, income, plz);
            break;

        case 2:
            //mainscreen_addTreeCSV(bptr);
            break;
        case 3:
            cout << "+ Bitte geben Sie den zu loeschenden Datensatz an" << endl;
            cout << " OrderID ?> "; cin >> oID;

            if (b.deleteNode(oID))
                cout << endl << "+ Eintrag wurde geloescht." << endl;
            else
                cout << endl << "////Loeschoperation hat nicht funktioniert.////";
            break;
        case 4:
            cout << "+ Bitte geben Sie den zu suchenden Datensatz an" << endl;
            cout << " Name ?> "; getline(cin >> ws, name);

            if (b.searchNode(name))
                cout << "////Search successful.////" << endl << endl;
            else
                cout << "////Search unsuccessful.////" << endl << endl;
            break;
        case 5:
            b.printAll();
            break;
        case 6:
            b.levelOrder();
            break;
        default:
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
