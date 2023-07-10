#pragma once
#include <iostream> 

enum Rarity{COMMON, UNCOMMON, RARE, VERY_RARE, E_TECH, LEGENDARY, PEARLECENT, SERAPH};
enum Manufacturer{ATLAS, HYPERION, MALIWAN, JAKOBS, TEDIORE, DAHL, VLADOF, BANDIT};

class Item {
private:
	Rarity r;
	long int price;
	int level;
	Manufacturer m;

public:
	Rarity get_r() const { return r; }
	void set_r(Rarity rr) { r = rr; }
	long int get_p()const { return price; }
	void set_p(long int pp) { price = pp; }
	int get_lvl()const { return level; }
	void set_lvl(int ll) { level = ll; }

	Item() {}
	Item(Rarity rr, long int pp, int lvl, Manufacturer mm) : r{ rr }, price{ pp }, level{ lvl }, m{mm} {}

	virtual void print_item() const;
};