#include "Functions.h"
#include "Semaphore.h"

int main()
{
	threads_noSync();
	mtx::threads_Sync();
	sem::threads_Sync();

	return 0;
}