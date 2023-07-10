#include "Item.h"
using namespace std;

void Item::print_item() const
{
	cout << "Item Info:\n"; 
		cout << "Rarity: " << get_r() << '\n';
		cout << "Price: " << get_p() << '\n';
		cout << "Level: " << get_lvl() << '\n';
}
