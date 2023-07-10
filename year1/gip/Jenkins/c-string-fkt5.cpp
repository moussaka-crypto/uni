#include <iostream>
using namespace std;

unsigned int my_strlen(const char* ptr)
{
	int i = 0;
	for (; ; i++)
	{
		if (ptr[i] == '\0')
		{ break; }
	}
	return i;
}

int my_strcmp(const char* ptr1, const char* ptr2)
{
	unsigned int ptr1_len = my_strlen(ptr1);
	unsigned int ptr2_len = my_strlen(ptr2);
	unsigned int i = 0;
	if (ptr1_len == ptr2_len)
	{
		for (; i < ptr1_len; i++)
		{
			if (ptr1[i] != ptr2[i])
			{ break; }
		}
	}
	if (i == ptr1_len && i == ptr2_len)
	{ return 0;}
	else if (ptr1_len < ptr2_len)
	{ return 1; }
	else
	{ return -1; }
}

struct w_haeufigkeit
{
	char* wort;
	unsigned int haeufigkeit;
};