#include <iostream>

int main() {
    char letter;
    std::cout << "Geben Sie einen Kleinbuchstaben ein: ";
    std::cin >> letter;

    if (letter >= 'a' && letter <= 'z') {
        int position = letter - 'a' + 1;
        std::cout << "Die Position des Buchstabens " << letter << " im Alphabet ist: " << position << std::endl;
    } 
    else {
        std::cout << "Ungültige Eingabe. Bitte geben Sie einen Kleinbuchstaben ein." << std::endl;
    }

    return 0;
}
