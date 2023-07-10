//Ausgabe
#include<iostream> 
#include<string>

//Threads
#include<thread> 
#include<mutex>
#include<condition_variable>

//Daten
#include"Output_Type.h"
#include"Semaphor.h"

//Funktionen zur Ausgabe mit verschiedenen Methoden
#include"Unsynchronized.h"
#include"Mutex_call.h"
#include"Semaphor_call.h"

//Critical Region 
std::string output = "";

int main() {
	
	std::cout << "--------------------------- Unsynchronized ---------------------------" << std::endl;
	
	std::thread t1(thread_1_un, std::ref(output));
	std::thread t2(thread_2_un, std::ref(output));
	std::thread t3(thread_3_un, std::ref(output));

	t1.join();
	t2.join();
	t3.join();

	std::cout << std::endl;
	
	std::cout << "------------------------------- Mutex -------------------------------" << std::endl;
	

	std::thread t4(thread_1_mutex,std::ref(output));
	std::thread t5(thread_2_mutex, std::ref(output));
	std::thread t6(thread_3_mutex, std::ref(output));

	t4.join();
	t5.join();
	t6.join();

	std::cout << std::endl;
	
	std::cout << "------------------------------ Semaphor -----------------------------" << std::endl;
	
	std::thread t7(thread_1_semaphor, std::ref(output));
	std::thread t8(thread_2_semaphor, std::ref(output));
	std::thread t9(thread_3_semaphor, std::ref(output));

	t7.join();
	t8.join();
	t9.join();

	std::cout << std::endl;
	
	system("PAUSE");
	return 0;
}