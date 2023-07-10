#pragma once
#include <string>
#include <iostream>

int zeichenkette_suchen_rekursiv(std::string text,
	std::string zkette,
	unsigned int text_pos = 0,
	unsigned int text_such_pos = 0,
	unsigned int zkette_such_pos = 0
);