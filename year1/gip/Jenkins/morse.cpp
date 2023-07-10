#include <iostream>
#include <string>

struct T_Morse_Data
{
	char letter;
	std::string morse_code;
};
const T_Morse_Data morse_data[] = {
		{ 'a', ".-" },
		{ 'b', "-..." },
		{ 'c', "-.-." },
		{ 'd', "-.." },
		{ 'e', "." },
		{ 'f', "..-." },
		{ 'g', "--." },
		{ 'h', "...." },
		{ 'i', ".." },
		{ 'j', ".---" },
		{ 'k', "-.-" },
		{ 'l', ".-.." },
		{ 'm', "--" },
		{ 'n', "-." },
		{ 'o', "---" },
		{ 'p', ".--." },
		{ 'q', "--.-" },
		{ 'r', ".-." },
		{ 's', "..." },
		{ 't', "-" },
		{ 'u', "..-" },
		{ 'v', "...-" },
		{ 'w', ".--" },
		{ 'x', "-..-" },
		{ 'y', "-.--" },
		{ 'z', "--.." },
		{ '0', "-----" },
		{ '1', ".----" },
		{ '2', "..---" },
		{ '3', "...--" },
		{ '4', "....-" },
		{ '5', "....." },
		{ '6', "-...." },
		{ '7', "--..." },
		{ '8', "---.." },
		{ '9', "----." },
		// Leerzeichen zur Worttrennung werden im Morsecode        
		// durch einen Slash '/' umgeben von Leerzeichen     
		// dargestellt ...       
		// (Alternative: Trennung durch 3 Leerzeichen)     
		// Hier bei uns, um die Testläufe eindeutiger zu        
		// machen: Trennung mittels drei Slashes      
				{ ' ', "///" },

				{ '.', ".-.-.-" },
				{ ',', "--..--" },
				{ ':', "---..." },
				{ '?', "..--.." },
				{ '-', "-....-" },
				{ '/', "-..-." },
				{ '@', ".--.-." },
				{ '=', "-...-" }
};

const int morse_data_len = 45;

int main()
{
	std::string eingabe = "";
	std::cout << "Bitte Text eingeben (ggfs. mit Leerzeichen): ? ";
	std::getline(std::cin, eingabe);

	for (unsigned int i = 0; i < eingabe.size(); i++)
	{

		for (int j = 0; j < morse_data_len; j++)
		{
			if (eingabe.at(i) >= 'A' && eingabe.at(i) <= 'Z')
			{
				eingabe.at(i) = eingabe.at(i) + ('a' - 'A');
				//cout << endl;
				//cout << eingabe.at(i)<<endl;
			}
			if (morse_data[j].letter == eingabe.at(i))
			{
				std::cout << morse_data[j].morse_code << "#";
				break;
			}
		}

	}
	std::cout << std::endl;
	system("PAUSE");
	return 0;
}