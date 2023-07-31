#include "Logged_Obj.h"

int main()
{
	Logged_Object o1;
	//o1.log_cpp("Logged_Object o1;"); 

	Logged_Object o2 = o1;
	//o2.log_cpp("Logged_Object o2 = o1;");

	Logged_Object o3;
	//o3.log_cpp("Logged_Object o3;");

	o3 = o1;
	//o3.log_cpp("o3 = o1;"); // ... Befehle (log.cpp) sind nur zu Demonstrationszwecken,
							// nicht in der Aufgabe gefordert
	return 0;
}